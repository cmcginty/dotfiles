# save a directory to 'param'
# function a() { alias $1=cd\ $PWD; }
function java-imports() {
   grep -rh ^import --include="*.java" $@ |
      sed -r "s/import (.*)\..+;/\1/" | sort | uniq
}
function find-replace() {
   find . -name "${1}" -type f -exec sed -i "s/${2}/${3}/g" {} \+
}
function grep-gradle() {
   g ls | grep -i .gradle | xargs -i grep -H -i "${1}" '{}'
}
function grep-ant() {
   g ls | grep -i 'build.*.xml' | xargs -i grep -H -i "${1}" '{}'
}
function fr() {
   for F in $@; do file-roller $(readlink -f $F) & done
}

# git
alias gdg='git ls-files | grep -i'

# misc
alias apt-get='sudo apt-get'
alias aptar='apt-get autoremove'
alias aptin='apt-get install'
alias aptrm-conf='aptitude -F %p search "~c" | xargs sudo dpkg -P'
alias aptrm='apt-get purge'
alias aptug='apt-get upgrade'
alias aptup='apt-get update'
alias bt-work="btmakemetafile --piece_size_pow2 24 http://192.168.1.7:6969/announce"
alias cdrdao-flac-m='flac -f -d *.flac && mktoc -m *.cue > out.toc && cdrdao-write --multi out.toc && rm -rf *.wav *.toc wav-18;'
alias cdrdao-flac='flac -f -d *.flac && mktoc *.cue > out.toc && cdrdao-write out.toc && rm -rf *.wav *.toc wav-18;'
alias cdrdao-write='sudo cdrdao write --eject --device /dev/sr0'
alias cdrdao='sudo cdrdao'
alias cryptsetup='sudo cryptsetup'
alias deborphan='deborphan -a'
alias deborphan='sudo deborphan'
alias df="df -h"
alias dock='sudo /home/pcm/bin/dock.sh'
alias eac='wine ~/.wine/drive_c/Program\ Files/Exact\ Audio\ Copy/EAC.exe'
alias enscript='enscript -2 -C -G -r -T 4'
alias flacsync='flacsync -r'
alias hdparm='sudo hdparm'
alias invoke-rc.d='sudo invoke-rc.d'
alias iptables='sudo iptables'
alias jad-ni="jad -d . -s java -ff -noctor -noinner -o -space -pi100 -v -lnc"
alias jad="jad -d . -s java -ff -noctor -o -space -pi100 -v -lnc"
alias jks-ls='keytool -list -v -keystore'
alias line_count='find . -name "*.[ch]" | xargs cat | wc'
alias lvdisplay='sudo lvdisplay'
alias lvds='xrandr --output LVDS --auto --output VGA --off'
alias lvscan='sudo lvscan'
alias mailq-flush='sudo exim -qff'
alias mailq='sudo mailq'
alias mdadm='sudo mdadm'
alias mktoc='mktoc -c -18'
alias mount='sudo mount'
alias orphaner='sudo orphaner -a --purge'
alias p4admin='p4admin&'
alias p4v='p4v&'
alias psg='ps ax | grep'
alias pvdisplay='sudo pvdisplay'
alias pvscan='sudo pvscan'
alias raradd='rar a -m5 -t -v15000k'
alias rdesktop='rdesktop -x l -g 1024x768 -a 16 -k en-us'
alias rdp='rdesktop'
alias restart='sudo restart'
alias rmb='restart mythtv-backend'
alias sdcp='sudo cp'
alias sdmv='sudo mv'
alias sdrm='sudo rm'
alias sdvi='sudo gvim -p > /dev/null 2>&1'
alias smartctl='sudo smartctl'
alias ssl-p12-ls='openssl pkcs12 -in'
alias ssl-rsa-ls='openssl rsa -noout -text -in'
alias ssl-rsa-mod='openssl rsa -noout -modulus -in'
alias ssl-x509-issuer='openssl x509 -noout -issuer -in'
alias ssl-x509-ls='openssl x509 -noout -text -fingerprint -md5 -in'
alias ssl-x509-mod='openssl x509 -noout -modulus -in'
alias start='sudo start'
alias stop='sudo stop'
alias su='sudo -i'
alias sysv-rc-conf='sudo sysv-rc-conf'
alias tattletale='java -Xmx512m -jar ~/src/tattletale/tattletale.jar'
alias tig='tig --all'
alias ufw='sudo ufw'
alias umount-nfs='sudo umount -a -t nfs'
alias umount='sudo umount'
alias undock='sudo /home/pcm/bin/undock.sh'
alias vga='xrandr --output LVDS --off --output VGA --auto'
alias vgdisplay='sudo vgdisplay'
alias vgscan='sudo vgscan'
alias vi='gvim > /dev/null 2>&1'
alias vim='gvim > /dev/null 2>&1'
alias vobcopy='vobcopy /media/dvd'
alias xine-dvd='xine dvd:/"`pwd`"'

