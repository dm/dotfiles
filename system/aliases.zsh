#if [ "$TERM" != "dumb" ]; then
#    eval "`dircolors -b`"
#fi

# Find a file with a pattern in name:
# Find a file with pattern $1 in name and Execute $2 on it:
function findExec() { find . -type f -iname '*'$1'*' -exec "${2:-file}" {} \;  ; }

alias fe=findExec

alias spwd='pwd | pbcopy'  # copy the current working directory to the clipboard

alias diffcol="diff -y -W 160" # side by side diff 160 columns wide

alias combinepdf='gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=output.pdf -dBATCH'

whiteboard () {
  convert "$1" -morphology Convolve DoG:15,100,0 -negate -normalize -blur 0x1 -channel RBG -level 60%,91%,0.1 "$2"
}
