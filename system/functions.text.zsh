# Show line, optionally show surrounding lines
line() {
	local LINE_NUMBER=$1
	local LINES_AROUND=${2:-0}
	sed -n "`expr $LINE_NUMBER - $LINES_AROUND`,`expr $LINE_NUMBER + $LINES_AROUND`p"
}

# Show duplicate/unique lines
dupline() {
	sort $1 | uniq -d
}
uniqline() {
	sort $1 | uniq -u
}

# Extract lines from 2nd file that do not exist in 1st file
xdiff() {
	awk 'FNR==NR{old[$0];next};!($0 in old)' $1 $2 >> $3
}

# Generate and print a UUID
function uuid() {
	od -x /dev/urandom | head -1 | awk '{OFS="-"; print $2$3,$4,$5,$6,$7$8$9}'
}

# Get a character’s Unicode code point
function codepoint() {
	perl -e "use utf8; print sprintf('U+%04X', ord(\"$@\"))";
	# print a newline unless we’re piping the output to another program
	if [ -t 1 ]; then
		echo ""; # newline
	fi;
}

# Open man page as PDF in OS X
function manpdf() {
	man -t "${1}" | open -f -a /Applications/Preview.app/
}
