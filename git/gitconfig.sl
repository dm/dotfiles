[core]
	excludesfile = ~/.gitignore_global
	editor        = vim
	autocrlf      = input
	legacyheaders = false # >git 1.5
# http://stackoverflow.com/questions/136178/git-diff-handling-long-lines
	pager         = less -rK
	precomposeUnicode = true
	#pager        = more
# if ↑ doesn’t work, try: pager = less -+$LESS -FRX


# http://git-scm.com/2010/03/08/rerere.html
[rerere]
	enabled = true


[user]
	name = Daniel Macedo
	email = admacedo@gmail.com
	signingkey = 9EF27322


[github]
	user     = dm


[hub]
	username = dm
	protocol = ssh


[alias]
	al     = !git config --list | grep 'alias\\.' | sed 's/alias\\.\\([^=]*\\)=\\(.*\\)/\\1\\\t => \\2/' | sort
	aa     = add --all
	amend  = !git commit --amend
	amendd = !git commit --amend --date=\"$(date)\"
	amendf = !git commit --amend --no-edit
	b      = branch
	cc     = !git shortlog -n -s
	co     = checkout
	c      = commit -S -m
	ca     = commit -a -S -m
	ci     = commit
	cis    = commit -S
	cur    = rev-parse HEAD
	create = !git init && hub create -p `basename $PWD`
	dc     = diff --cached
	dh     = diff HEAD~1
	dhn    = !"d() { git diff --patch-with-stat HEAD~$1; }; git diff-index --quiet HEAD -- || clear; d"
	di     = diff --color-words
	dipd   = log --oneline prd..dev
	div    = divergence
	ds     = diff --stat=160,120
	bv     = !git branch --color -v | cut -c1-100
	fa     = fetch --all -v
	ff     = merge --ff-only
	fix    = !"f() { git commit --fixup $1; PREVIOUS=$(git log --pretty=%P -n 1 $1); }; f"
	fixup  = !sh -c 'REV=$(git rev-parse $1) && git commit --fixup $@ && GIT_SEQUENCE_EDITOR=true git rebase -i --autosquash $REV^' -
	fp     = format-patch --stdout
	gn     = goodness
	gnc    = goodness --cached
	head   = !git l -1
	h      = !git head
	hp     = rev-parse --short HEAD
	ignore = !([ ! -e .gitignore ] && touch .gitignore) | echo $1 >> .gitignore
	la     = !glog
	l      = log --abbrev-commit --all --color --graph --oneline -20
	lo     = log --abbrev-commit --all --decorate --graph --oneline --color
	ll     = !git lo --stat --abbrev-commit -l 10
	new    = !git init && git ci --allow-empty -m 'Initial commit (empty)' && hub create -p `basename $PWD`
	noff   = merge --no-ff
	pom    = push origin master
	pullff = pull --ff-only
	r      = !git l -20 | cat # Recent 20 commits
	ra     = !git r --all
	s      = status -sb --ignore-submodules=untracked
	sb     = !git show-branch $(git show-ref --heads | cut -c41-)
	squash = !sh -c 'REV=$(git rev-parse $1) && git commit --squash $@ && git rebase -i --autosquash $REV^' -
	ss     = status -sb -uno --ignore-submodules=untracked
	st     = status
	sd     = !git status | grep deleted | awk '{print $3}' | xargs git rm
	wip    = !git add -u && git commit -m ...
	wipc   = !date >> WIP && git add WIP && git commit -m ...
	x      = checkout HEAD


[color]
	diff        = auto
	status      = auto
	branch      = auto
	ui          = auto
	interactive = auto


[color "diff"]
	meta = blue bold
	frag = magenta bold
	old  = red bold
	new  = green bold


[color "branch"]
	current = yellow reverse
	local   = yellow bold
	remote  = green bold
	plain   = red bold


[color "status"]
	added     = yellow
	changed   = green bold
	untracked = blue bold


[merge]
	log = true


[apply]
	whitespace = nowarn


[help]
	browser = open


[branch]
	autosetuprebase = always


# NEVER run Garbage Collection
[gc]
	auto = 0


[format]
	pretty = %C(yellow)%h%Creset %s %C(red)(%an, %cr)%Creset


[log]
	folow = true


[push]
	default = current


[gui]
	editor = vim


[filter "lfs"]
	clean = git-lfs clean -- %f
	process = git-lfs filter-process
	required = true
	smudge = git-lfs smudge -- %f


[git-up "fetch"]
	prune = false
	all = true


[commit]
	gpgsign = true

[gpg]
	program = gpg2
