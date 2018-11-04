#!/bin/bash

# Set 'true' to disable backups
DEBUG=${DEBUG:-false}

#
# NOTE: Before running this script for the first time the Borg repo must be initialized with
#       the command below.
#
#   borg init --encryption=repokey backup@pine64:$(hostname)
#
# Then create the ~/.borgconfig file containing:
#
#   export BORG_PASSPHRASE='<YOUR_PHRASE_HERE>'
#   export BORG_REPO=<USER>@<HOSTNAME>:<REPO_NAME>
#   BORG_BACKUP_DIRS=<DIRS>
#   BORG_COMPRESSION=<COMPRESSION>,<NUM>
#
# To exclude files or dirs, create a ~/.borgignore file.
#

[ -e .borgconfig ] && source .borgconfig
[ -e $HOME/.borgconfig ] && source $HOME/.borgconfig

$DEBUG && STATS_OR_DRYRUN="--dry-run --list" || STATS_OR_DRYRUN="--stats"

# Find exclude files
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

EXCLUDE_HOST_FILE="$SCRIPT_DIR/borgignore-$(hostname)"
EXCLUDE_LOCAL_FILE="$HOME/.borgignore"

[ -e $EXCLUDE_HOST_FILE  ] && EXCLUDE_HOST_ARG="--exclude-from $EXCLUDE_HOST_FILE"
[ -e $EXCLUDE_LOCAL_FILE ] && EXCLUDE_HOME_ARG="--exclude-from $EXCLUDE_LOCAL_FILE"


# some helpers and error handling:
info() { printf "\n%s %s\n\n" "$( date )" "$*" >&2; }
trap 'echo $( date ) Backup interrupted >&2; exit 2' INT TERM

info "Starting backup"

# Backup the most important directories into an archive named after
# the machine this script is currently running on:

borg create                         \
    --verbose                       \
    --filter 'AME-'                 \
    $STATS_OR_DRYRUN                \
    --show-rc                       \
    --compression $BORG_COMPRESSION \
    --exclude-caches                \
    $EXCLUDE_HOST_ARG               \
    $EXCLUDE_HOME_ARG               \
    ::'{now}'                       \
    $BORG_BACKUP_DIRS

backup_exit=$?

info "Pruning repository"

# Use the `prune` subcommand to maintain 7 daily, 4 weekly and 6 monthly
# archives of THIS machine. The '{hostname}-' prefix is very important to
# limit prune's operation to this machine's archives and not apply to
# other machines' archives also:

borg prune                          \
    --list                          \
    $STATS_OR_DRYRUN                \
    --show-rc                       \
    --keep-within   24H             \
    --keep-hourly   1               \
    --keep-daily    6               \
    --keep-weekly   1               \
    --keep-monthly  1

prune_exit=$?

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

exit ${global_exit}
