

# Calculator
calc() {
	echo "$*" | bc -l;
}

# Weather
weather() {
	curl -4 "wttr.in"
}
meteo() {
	local CITY=${1:-London}
	curl -4 "wttr.in/$CITY"
}
