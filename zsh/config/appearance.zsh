setopt long_list_jobs            # list jobs in long format
setopt prompt_subst              # allow variable substitutions in the prompt
setopt print_exit_value          # print non-zero exit values
autoload -Uz colors; colors      # color functions so ansi codes are unnecessary
autoload -Uz vcs_info; vcs_info  # version control info functions

# use grc (if available) to colorize common commands
if command -v grc &>/dev/null; then
	alias colorify="`which grc` -es --colour=auto"
	alias configure='colorify ./configure'
	alias diff='colorify diff'
	alias make='colorify make'
	alias gcc='colorify gcc'
	alias g++='colorify g++'
	alias as='colorify as'
	alias gas='colorify gas'
	alias ld='colorify ld'
	alias netstat='colorify netstat'
	alias ping='colorify ping'
	alias traceroute='colorify traceroute'
fi
