# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD
# this makes cd=pushd
setopt AUTO_PUSHD
# this will ignore multiple directories for the stack.  Useful?  I dunno.
setopt PUSHD_IGNORE_DUPS
# 10 second wait if you do something that will delete everything.
setopt RM_STAR_WAIT
# case insensitive globbing
setopt NO_CASE_GLOB
# be reasonable!
setopt NUMERIC_GLOB_SORT
# I don't know why I never set this before.
setopt EXTENDED_GLOB
# oh wow!  This is killer...  try it!
bindkey -M vicmd 'q' push-line
# !NNN, history auto-completion after space
bindkey -M viins ' ' magic-space
# catch accidental CTRL-D
# setopt ignoreeof
