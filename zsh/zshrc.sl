export ZSH=$HOME/.oh-my-zsh
export WORK=$HOME/work/

# shortcut to this dotfiles path is $DOT
export DOT=$HOME/.dotfiles

ZSH_CUSTOM="$DOT/zsh/custom"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(
  branch
  compleat
  #ssh-agent
  #zsh-completions

  #aws
  #battery
  #bgnotify
  #bower
  #brew
  #brew-cask
  #bundler
  #catimg
  #codeclimate
  #colored-man-pages
  #colorize
  #command-not-found
  #common-aliases
  #composer
  #debian
  #docker
  #docker-compose
  #gem
  #git
  #git-fast
  #git-flow
  #github
  #grunt
  #gulp
  #httpie
  #jira
  #kubectl
  #laravel
  #laravel5
  #man
  #nmap
  #node
  #nvm
  #osx
  #pep8
  #postgres
  #python
  #rails
  #rake
  #rbenv
  #react-native
  #redis-cli
  #rsync
  #ruby
  #sublime
  #sudo
  #symfony
  #symfony2
)

source $ZSH/oh-my-zsh.sh

# source every .zsh file in this rep
for config_file ($DOT/**/*.zsh) source $config_file

# OpenPGP applet support for YubiKey
#if [ ! -f /tmp/gpg-agent.env ]; then
#  killall gpg-agent;
#  eval $(gpg-agent --daemon --enable-ssh-support > /tmp/gpg-agent.env);
#fi
#. /tmp/gpg-agent.env

# Python
export PATH="$HOME/Library/Python/3.8/bin:/opt/homebrew/bin:$PATH"

# Node NVM
if [ -d ~/.nvm ]; then
  export NVM_DIR=~/.nvm
  alias loadnvm='unalias nvm; source $(brew --prefix nvm)/nvm.sh'
  alias nvm="echo 'Did you forget to run loadnvm?'"
else
  alias nvm="echo 'NVM not installed...'"
fi

# Load my own zsh theme
source $DOT/zsh/dm.zsh-theme

# Go
export GOPATH=$HOME/work/go
export PATH=${PATH}:${GOPATH}/bin

# Add proper path entries
PATH=${PATH}:${HOME}/.bin:${HOME}/node_modules/.bin:${HOME}/.composer/vendor/bin
if [[ "$OSX" == "1" && "$GNU_USERLAND" == "1" ]];
then
    if [ -d /usr/local/opt/coreutils/libexec/gnubin ];
    then
        PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/sbin:$PATH"
    else
        PATH=$PATH:/usr/local/sbin:/usr/local/opt/coreutils/bin
    fi
fi
export PATH

# AWSAM https://github.com/mheffner/awsam
## Different Ruby version will cause:
## rbenv: raem: command not found
## Fix by installing the gem.
## $ gem install awsam
#if [ -s $HOME/.awsam/bash.rc ]; then
#    source $HOME/.awsam/bash.rc
#fi

export GITHUB_USER=dm

# Unbreak broken, non-colored terminal
export TERM='xterm-color'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"


export EDITOR=vim
# GNU Screen sets -o vi if EDITOR=vi, so we have to force it back. What the
# hell, GNU?
set -o emacs

export ACK_COLOR_MATCH='red'

if [[ "$OSX" == "1" ]];
then
  # Homebrew
  export HOMEBREW_NO_AUTO_UPDATE=1
  export HOMEBREW_NO_EMOJI=1
fi

fpath=(/usr/local/share/zsh-completions $fpath)

eval "$(direnv hook zsh)"

# Common
[[ -s "$HOME/.commonrc" ]] && source "$HOME/.commonrc"

# use .localrc for settings specific to one system
[[ -f "$HOME/.localrc" ]] && source "$HOME/.localrc"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
