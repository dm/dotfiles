# GIT

alias g="git"

alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gd='git diff-index --quiet HEAD -- || clear; git --no-pager diff --patch-with-stat'
alias gf='git fetch -v --all --tags'
alias gfp='git fetch -v --all --tags --prune'
alias gitcheck="find . -maxdepth 1 -type d -exec sh -c 'echo {}; cd {} && git wtf; echo' \;"
alias gl='git pull'
alias glm='git pull --merge'
alias glr='git pull --rebase'
alias gp='git push origin HEAD'
alias gpf='git push -f --force-with-lease'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias grbs='git rebase --skip'
alias grv='git remote -v'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias gs="git s"
alias gsu="git submodule update --init --recursive"

# Stashes
alias gss='git stash save'
alias gsp='git stash save'

# GIST
# Gist create private
alias gscp='gist -p -c'
