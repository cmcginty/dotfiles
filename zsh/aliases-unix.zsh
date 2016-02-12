# UNIX Commands

# enable alias expansion w/ sudo
alias sudo='sudo '

# quick switch to root
alias su='sudo -i'

# remove prezto default '-i' args
alias cp='nocorrect cp'
alias mv='nocorrect mv'
alias rm='nocorrect rm'

# processes
alias psg='ps ax | grep'

# terminal tricks
alias watch='watch --color'
alias please='sudo $(fc -ln -1)'

# raid
alias mdadm='sudo mdadm'

# lvm
alias lvdisplay='sudo lvdisplay'
alias lvscan='sudo lvscan'
alias pvdisplay='sudo pvdisplay'
alias pvscan='sudo pvscan'
alias vgdisplay='sudo vgdisplay'
alias vgscan='sudo vgscan'

# file system
alias df='df -h'
alias hdparm='sudo hdparm'
alias mount='sudo mount'
alias smartctl='sudo smartctl'
alias umount-nfs='sudo umount -a -t nfs'
alias umount='sudo umount'

# services
alias invoke-rc.d='sudo invoke-rc.d'
alias restart='sudo restart'
alias start='sudo start'
alias stop='sudo stop'
