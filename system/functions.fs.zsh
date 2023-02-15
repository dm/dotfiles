# Create a new directory and enter it
mk() {
	mkdir -p "$@" && cd "$@"
}
mkcd ()
{
	mkdir -p -- "$1" &&
	cd -P -- "$1"
}

# Fuzzy find file/dir
ff() {  find . -type f -iname "$1";}
fff() { find . -type f -iname "*$1*";}
fd() {  find . -type d -iname "$1";}
fdf() { find . -type d -iname "*$1*";}

# Extract many types of compress files
# Source: http://nparikh.org/notes/zshrc.txt
extract() {
	if [ -f "$1" ]; then
		case "$1" in
			*.tar.bz2)  tar -jxvf "$1" ;;
			*.tar.gz)   tar -zxvf "$1" ;;
			*.bz2)    bunzip2 "$1" ;;
			*.dmg)    hdiutil mount "$1" ;;
			*.gz)     gunzip "$1" ;;
			*.tar)    tar -xvf "$1" ;;
			*.tbz2)   tar -jxvf "$1" ;;
			*.tgz)    tar -zxvf "$1" ;;
			*.zip)    unzip "$1" ;;
			*.ZIP)    unzip "$1" ;;
			*.pax)    cat "$1" | pax -r ;;
			*.pax.Z)  uncompress "$1" --stdout | pax -r ;;
			*.Z)    uncompress "$1" ;;
			*)      echo "'$1' cannot be extracted/mounted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file to extract"
	fi
}

# Copy w/ progress
cp_p()
{
	rsync -WavP --human-readable --progress $1 $2
}

# Check if resource is served compressed
check_compression() {
	curl --write-out 'Size (uncompressed) = %{size_download}\n' --silent --output /dev/null $1
	curl --header 'Accept-Encoding: gzip,deflate,compress' --write-out 'Size (compressed) =   %{size_download}\n' --silent --output /dev/null $1
	curl --head --header 'Accept-Encoding: gzip,deflate' --silent $1 | grep -i "cache\|content\|vary\|expires"
}

# Create a data URL from a file
dataurl() {
	local MIMETYPE=$(file --mime-type "$1" | cut -d ' ' -f2)
	if [[ $MIMETYPE == "text/*" ]]; then
		MIMETYPE="${MIMETYPE};charset=utf-8"
	fi
	echo "data:${MIMETYPE};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
	tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}
