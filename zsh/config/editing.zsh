bindkey -e # generally use emacs keybindings

# Edit command line - this is freaking awesome!
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-e' edit-command-line

# remove '/' from default set of characters that are treated as part of a word,
#   makes backward-delete-word and others more useful with paths
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# search on up/down arrow if a partial cmd is entered, otherwise browse history
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

bindkey '\C-p' up-line-or-search
bindkey '\C-n' down-line-or-search

bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word

# expand history abbreviations when hitting space
bindkey ' ' magic-space

# bind Esc-s to prepend 'sudo ' to the current line
insert-sudo () {
  BUFFER="sudo $BUFFER"
  CURSOR=$#BUFFER
}
zle -N insert-sudo
bindkey '^[s' insert-sudo
