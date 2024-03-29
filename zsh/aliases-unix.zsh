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
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3 | head -10'

# terminal tricks
alias watch='watch --color'
alias please='sudo $(fc -ln -1)'
alias path='echo -e ${PATH//:/\\n}'
alias randfile='find . -type f -maxdepth 1 | sort -R | tail -n1'

# xargs using newlines as separater
alias nxargs='gxargs -i -d\\n'

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
alias ports='netstat -tulanp'
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
if [[ "$OSTYPE" == darwin* ]]; then
    alias timeat='date -r'
else
    function timeat { date -d @$1; }
fi
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

# notifications
alias chime='afplay /System/Library/Sounds/Ping.aiff'
function nag() {while true; do chime; sleep 10; done}
function alarm() {while true; do chime -t 0.5; done}
function samples() {for X in /System/Library/Sounds/*; do echo $X; afplay $X; done}
