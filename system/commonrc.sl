# Load things
if [ -f ~/.aliases ]; then
	source ~/.aliases
fi

if [ -f ~/.functions ]; then
	source ~/.functions
fi

# Git helpers
if [ -f ~/.githelpers ] ; then
	source ~/.githelpers
fi

# Adjust $PATH
if [ -d ~/.scripts ] ; then
	export PATH=$HOME/.scripts:$PATH
fi

# Misc settings
export EDITOR=vim

# rbenv
if [ -d "$HOME/.rbenv/bin" ] ; then 
	export PATH=$PATH:"$HOME/.rbenv/bin"
	eval "$(rbenv init -)"
fi

