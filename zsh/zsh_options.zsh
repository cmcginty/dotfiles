# 'cd' to dir without typing the 'cd' command
setopt AUTO_CD
# Makes cd=pushd, 'popd' to go back
setopt AUTO_PUSHD
# Ignore multiple directories for the stack.
setopt PUSHD_IGNORE_DUPS
# 10 second wait if you do something that will delete everything.
setopt RM_STAR_WAIT
# Case insensitive globbing
setopt NO_CASE_GLOB
#
setopt NUMERIC_GLOB_SORT
#
setopt EXTENDED_GLOB
# Save lines in history that have leading spaces. (i.e copied/pasted to the term)
unsetopt HIST_IGNORE_SPACE
#
bindkey -M vicmd 'q' push-line
# !NNN, history auto-completion after space
bindkey -M viins ' ' magic-space

# vim command mode with <CTRL><SPACE>
bindkey '^ ' vi-cmd-mode

# common vim bindings
bindkey -a 'gg' beginning-of-buffer-or-history
bindkey -a 'g~' vi-oper-swap-case
bindkey -a G end-of-buffer-or-history

# vim backspace doesn't stop where you started insert mode
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
