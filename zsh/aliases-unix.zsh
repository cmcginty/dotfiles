# UNIX Commands

# enable alias expansion w/ sudo
alias sudo='sudo '

# quick switch to root
alias suroot='sudo -E zsh'

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

alias tree='tree --dirsfirst'
alias t1='tree -L 1'
alias t2='tree -L 2'
alias t3='tree -L 3'

# services
alias invoke-rc.d='sudo invoke-rc.d'
alias restart='sudo restart'
alias start='sudo start'
alias stop='sudo stop'

# formatting
alias sort-ip='sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4'

# time
alias unixdate='date +%s'
alias unixtime=unixdate
alias epoch=unixdate
alias timeat='date -r'
