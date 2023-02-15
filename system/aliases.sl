# Dir navigation
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'
alias .6='cd ../../../../../../..'
alias ~='cd ~'
alias cw='cd ~/work/'

alias cl=clear
alias reboot='sudo reboot'

# Search alias with grep
alias ag='alias | grep -i'

alias noton=launchctl load -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist

alias c='code-insiders'

# grep history
alias gh='fc -l 0 | grep'

alias whereami="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active' | egrep -o -m 1 '^[^\t:]+' | xargs ipconfig getifaddr; curl ipecho.net/plain; echo"
alias emptify="cat /dev/null > $1"

# Ubuntu apt
alias apt='sudo apt-get'
alias apt-get='sudo apt-get'
alias add-apt-repository='sudo add-apt-repository'
alias ai='sudo apt-get install'
alias au='sudo apt-get update'
alias ar='sudo apt-get purge'
alias auu='sudo apt-get update && sudo apt-get -y upgrade'

# Filesystem
# ls
alias l='ls -lhA'
alias ll='ls -lh'
alias lt='tree --dirsfirst -ChFupDaLg 1'
alias la='ls -lha'
alias ls='ls -h'
alias mount='mount | column -t'
alias mkdir='mkdir -pv'
#alias rm='rm --preserve-root'
alias wget='wget -c'
alias dh='dirs -v'  # directory history
alias duh='du -csh'

# Utilities
alias bc='bc -li'
alias d="du -hS -d 1"
alias df="df -h"
#alias grep='GREP_COLOR="1;37;45" LANG=C grep --color=auto'
alias grepa='grep -A 5 -B 5'
alias h="history"
#alias j='jobs -l'
alias j=jrnl
alias s=subl
alias sr="screen -r"
alias da='direnv allow'

# PHP
alias artisan="php artisan"
alias art="php artisan"
alias com="composer"
alias serve="php -S localhost:8000"

# Web/Net
alias header='curl -I'
alias headerc='curl -I --compress'
alias body='curl'
alias bodyc='curl --compress'
alias ports='netstat -tulanp'
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias s1='openssl sha1'
alias s2='openssl sha256'
alias s5='openssl sha512'
# SSH
alias e="ssh earth"


# DateTime
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%Y-%m-%d"'


# Vagrant
alias vu="vagrant up"
alias vul="LOCAL_SETUP=1 vagrant up"
alias vp="vagrant provision"
alias vpl="LOCAL_SETUP=1 vagrant provision"
alias vd="vagrant destroy -f"
alias vr="vagrant resume"
alias vh="vagrant halt"
alias vs="vagrant ssh"
alias vsu="vagrant suspend"
alias vre="vagrant resume"

alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Terminal notify, requires terminal-notifier
tnotify() {
  terminal-notifier -message "$1" -title "$2" -activate com.apple.Terminal
}

# Yup, I keep doing this in the shell :(
alias :q=exit
alias x=exit

# Go to GOPATH
alias gop='cd $GOPATH/src/github.com/'

function info { echo -e "\033[1;33m => $1\033[0m"; }
function ok { echo -e "\033[1;32m => $1\033[0m"; }
function error { echo -e "\033[1;31m => Error: $1\033[0m"; }
