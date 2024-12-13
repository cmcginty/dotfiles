#!/bin/bash
set -o pipefail

function info() { printf "\n%s %s\n\n" "$( date )" "$*" >&2; }

function now_to_secs() {
    : "${date_bin:=$(command -v gdate)}" "${date_bin:=$(command -v date)}"
    local midnight; midnight=$($date_bin -d0 +%s)
    local now; now=$($date_bin +%s)
    echo $((now - midnight))
}

function time_to_secs() {
    : "${date_bin:=$(command -v gdate)}" "${date_bin:=$(command -v date)}"
    local midnight; midnight=$($date_bin -d0 +%s)
    local time; time=$($date_bin -d"$1" +%s)
    echo $((time - midnight))
}

function exit_if_during_sleep_time() {
    : "${BORG_SLEEP:=()}"
    if ((${#BORG_SLEEP[@]} != 2)); then
        return
    fi
    local start_time; start_time=$(time_to_secs ${BORG_SLEEP[0]})
    local end_time; end_time=$(time_to_secs ${BORG_SLEEP[1]})
    local cur_time; cur_time=$(now_to_secs)
    local sleep
    # Sleep depending if the range overlaps to the next day.
    if ((start_time < end_time)); then
        sleep=$((start_time <= cur_time && cur_time < end_time ))
    else
        sleep=$((!(end_time <= cur_time && cur_time < start_time)))
    fi
    if ((sleep)); then
        info "Backup is disabled between ${BORG_SLEEP[0]} and" \
             "${BORG_SLEEP[1]}. Nothing to do!"
        exit
    fi
}

# Exception handling
: "${MKTEMP_BIN:=$(command -v gmktemp)}" "${MKTEMP_BIN:=$(command -v mktemp)}"
LOG=$($MKTEMP_BIN -t borgbackup.XXXXXX)
trap 'echo $( date ) Backup interrupted >&2; exit 2' INT TERM
trap 'rm -f $LOG' EXIT

# Treat the first arg as a file to redirect all output to.
if [[ -n $1 ]]; then
    exec >> "$1"
    exec 2>&1
fi

# Set 'true' to disable backups
: "${DEBUG:=false}"

#
# NOTE: Before running this script for the first time the Borg repo must be initialized with
#       the command below.
#
#   borg init --encryption=repokey backup@pine64:$(hostname -s)
#
# Then create the ~/.borgconfig file containing:
#
#   export BORG_PASSPHRASE='<YOUR_PHRASE_HERE>'
#   export BORG_REPO=<USER>@<HOSTNAME>:<REPO_NAME>
#   BORG_BACKUP_DIRS=<DIRS>
#   BORG_COMPRESSION=<COMPRESSION>,<NUM>
#   BORG_EMAIL=<EMAIL ADDRESS>
#   BORG_PRUNE=1
#
# To exclude files or dirs, create a ~/.borgignore file.
#

[ -e .borgconfig ] && source .borgconfig
[ -e "$HOME/.borgconfig" ] && source "$HOME/.borgconfig"

: "${BORG_PRUNE:=1}"

$DEBUG && STATS_OR_DRYRUN="--dry-run --list" || STATS_OR_DRYRUN="--stats"

# Check time if backups are disabled.
exit_if_during_sleep_time

# Find exclude files.
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # Resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    # if $SOURCE was a relative symlink, we need to resolve it relative to the
    # path where the symlink file was located
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
SCRIPT_DIR="$( cd "$( dirname "${SOURCE}" )" >/dev/null && pwd )"

EXCLUDE_HOST_FILE="$SCRIPT_DIR/borgignore-$(hostname -s)"
EXCLUDE_LOCAL_FILE="$HOME/.borgignore"

[ -e "$EXCLUDE_HOST_FILE"  ] && EXCLUDE_HOST_ARG=(--exclude-from "$EXCLUDE_HOST_FILE")
[ -e "$EXCLUDE_LOCAL_FILE" ] && EXCLUDE_HOME_ARG=(--exclude-from "$EXCLUDE_LOCAL_FILE")


info "Starting backup"

# Backup the most important directories into an archive named after
# the machine this script is currently running on:

borg create                           \
    --verbose                         \
    --filter 'AME-'                   \
    $STATS_OR_DRYRUN                  \
    --show-rc                         \
    --compression "$BORG_COMPRESSION" \
    --exclude-caches                  \
    "${EXCLUDE_HOST_ARG[@]}"          \
    "${EXCLUDE_HOME_ARG[@]}"          \
    ::'{now}'                         \
    "$BORG_BACKUP_DIRS" 2> >(tee "$LOG")

backup_exit=$?

if [[ $BORG_PRUNE -eq 1 ]]; then
    info "Pruning repository"

    # Use the `prune` subcommand to maintain 7 daily, 4 weekly and 6 monthly
    # archives of THIS machine. The '{hostname}-' prefix is very important to
    # limit prune's operation to this machine's archives and not apply to
    # other machines' archives also:

    borg prune                          \
        --list                          \
        $STATS_OR_DRYRUN                \
        --show-rc                       \
        --keep-within   48H             \
        --keep-daily    6               \
        --keep-weekly   3               \
        --keep-monthly  11              \
        --keep-yearly   2 2> >(tee -a "$LOG")

    prune_exit=$?
else
    prune_exit=0
fi

# use highest exit code as global exit code
global_exit=$(( backup_exit > prune_exit ? backup_exit : prune_exit ))

if [ ${global_exit} -eq 1 ];
then
    info "Backup and/or Prune finished with a warning"
fi

if [ ${global_exit} -gt 1 ];
then
    info "Backup and/or Prune finished with an error"
fi

if [[ ${global_exit} -gt 0 && -n $BORG_EMAIL ]];
then
    info "Sending notification to $BORG_EMAIL"
    mail -s "Borg Backup notification from $HOSTNAME" "$BORG_EMAIL" < "$LOG"
fi

exit ${global_exit}
