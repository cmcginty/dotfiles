# Ubuntu apt-get
alias apt-get='sudo apt-get'
alias aptar='apt-get autoremove'
alias aptin='apt-get install'
alias aptrm-conf='aptitude -F %p search "~c" | xargs sudo dpkg -P'
alias aptrm='apt-get purge'
alias aptug='apt-get upgrade'
alias aptup='apt-get update'
function aptrm-linux() {
   sudo apt-get purge $(for tag in "linux-image" "linux-headers" "linux-image-extra"
                        do dpkg-query -W -f'${Package}\n' "$tag-[0-9]*.[0-9]*.[0-9]*" |
                           sort -V |
                           awk 'index($0,c){exit} //' c=$(uname -r | cut -d- -f1,2)
                        done)
}

# remote desktop
alias rdesktop='rdesktop -x l -g 1024x768 -a 16 -k en-us'
alias rdp='rdesktop'

# fasd
alias jj='j -1'

# tmux
alias takeover="tmux detach -a"
