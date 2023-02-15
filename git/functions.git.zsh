
# Destructive! Resets all rebased commit dates to AUTHOR_DATE
git-reset-dates() {
	echo "Usage: git-reset-dates [ SHA1..HEAD ]"
	echo "Are you sure you wish to reset git commit dates to AUTHOR_DATE? (y/N)"
	read REPLY
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		if [ -z $1 ]; then
			git filter-branch --env-filter 'GIT_COMMITTER_DATE=$GIT_AUTHOR_DATE; export GIT_COMMITTER_DATE'
		else
			git filter-branch --env-filter 'GIT_COMMITTER_DATE=$GIT_AUTHOR_DATE; export GIT_COMMITTER_DATE' $1
		fi
	fi
}

# Destructive! Resets all rebased commit dates to COMMITER_DATE
git-reset-dates-commit() {
	echo "Usage: git-reset-dates [ SHA1..HEAD ]"
	echo "Are you sure you wish to reset git commit dates to COMMITER_DATE? (y/N)"
	read REPLY
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		if [ -z $1 ]; then
			git filter-branch --env-filter 'GIT_AUTHOR_DATE=$GIT_COMMITTER_DATE; export GIT_AUTHOR_DATE'
		else
			git filter-branch --env-filter 'GIT_AUTHOR_DATE=$GIT_COMMITTER_DATE; export GIT_AUTHOR_DATE' $1
		fi
	fi
}
