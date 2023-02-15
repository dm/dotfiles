# Python

pipis() {
	pip install "${1}" && pip freeze > requirements.txt
}

mkvenvhere() {
	mkvirtualenv -p python3 -a . $(basename $(pwd))
}
