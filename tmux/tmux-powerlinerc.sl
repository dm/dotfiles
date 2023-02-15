# Default configuration file for tmux-powerline.
# Modeline {
#	 vi: foldmarker={,} foldmethod=marker foldlevel=0 tabstop=4 filetype=sh
# }

# General {
	# Show which segment fails and its exit code.
	export TMUX_POWERLINE_DEBUG_MODE_ENABLED="false"
	# Use patched font symbols.
	export TMUX_POWERLINE_PATCHED_FONT_IN_USE="true"
	# The theme to use.
	export TMUX_POWERLINE_THEME="vv"
	# Overlay dirctory to look for themes. There you can put your own themes outside the repo. Fallback will still be the "themes" directory in the repo.
	export TMUX_POWERLINE_DIR_USER_THEMES="~/.config/themes"
	# Overlay dirctory to look for segments. There you can put your own segments outside the repo. Fallback will still be the "segments" directory in the repo.
	export TMUX_POWERLINE_DIR_USER_SEGMENTS=""
# }

# battery.sh {
	# How to display battery remaining. Can be {percentage, cute}.
	export TMUX_POWERLINE_SEG_BATTERY_TYPE="cute"
	# How may hearts to show if cute indicators are used.
	export TMUX_POWERLINE_SEG_BATTERY_NUM_HEARTS="5"
# }

# date.sh {
	# date(1) format for the date. If you don't, for some reason like ISO 8601 format, you might want to have "%D" or "%m/%d/%Y".
	export TMUX_POWERLINE_SEG_DATE_FORMAT="%d %b %Y"
# }

# earthquake.sh {
	# The data provider to use. Currently only "goo" is supported.
	export TMUX_POWERLINE_SEG_EARTHQUAKE_DATA_PROVIDER="goo"
	# How often to update the earthquake data in seconds.
	# Note: This is not an early warning detector, use this
	# to be informed about recent earthquake magnitudes in your
	# area. If this is too often, goo may decide to ban you form
	# their server
	export TMUX_POWERLINE_SEG_EARTHQUAKE_UPDATE_PERIOD="600"
	# Only display information when earthquakes are within this many minutes
	export TMUX_POWERLINE_SEG_EARTHQUAKE_ALERT_TIME_WINDOW="60"
	# Display time with this format
	export TMUX_POWERLINE_SEG_EARTHQUAKE_TIME_FORMAT='(%H:%M)'
	# Display only if magnitude is greater or equal to this number
	export TMUX_POWERLINE_SEG_EARTHQUAKE_MIN_MAGNITUDE="3"
# }

# hostname.sh {
	# Use short or long format for the hostname. Can be "short, long"
	export TMUX_POWERLINE_SEG_HOSTNAME_FORMAT="short"
# }

# mailcount.sh {
	# Mailbox type to use. Can be any of {apple_mail, gmail, maildir, mbox}
	export TMUX_POWERLINE_SEG_MAILCOUNT_MAILBOX_TYPE="gmail"

	## Gmail
	# Enter your Gmail username here WITH OUT @gmail.com.( OR @domain)
	export TMUX_POWERLINE_SEG_MAILCOUNT_GMAIL_USERNAME=""
	# Google password. Recomenned to use application specific password (https://accounts.google.com/b/0/IssuedAuthSubTokens) Leave this empty to get password from OS X keychain.
	# For OSX users : MAKE SURE that you add a key to the keychain in the format as follows
	# Keychain Item name : http://<value-you-fill-in-server-variable-below>
	# Account name : <username-below>@<server-below>
	# Password : Your password ( Once again, try to use 2 step-verification and application-specific password)
	# See http://support.google.com/accounts/bin/answer.py?hl=en&answer=185833 for more info.
	export TMUX_POWERLINE_SEG_MAILCOUNT_GMAIL_PASSWORD=""
	# Domain name that will complete your email. For normal GMail users it probably is "gmail.com but can be "foo.tld" for Google Apps users.
	export TMUX_POWERLINE_SEG_MAILCOUNT_GMAIL_SERVER="gmail.com"
	# How often in minutes to check for new mails.
	export TMUX_POWERLINE_SEG_MAILCOUNT_GMAIL_INTERVAL="5"

	## Maildir
	# Path to the maildir to check.
	#export TMUX_POWERLINE_SEG_MAILCOUNT_MAILDIR_INBOX="/Users/vish/.mail/inbox/new"

	## mbox
	# Path to the mbox to check.
	export TMUX_POWERLINE_SEG_MAILCOUNT_MBOX_INBOX=""
# }

# now_playing.sh {
	# Music player to use. Can be any of {audacious, banshee, cmus, itunes, lastfm, mocp, mpd, mpd_simple, rdio, rhythmbox, spotify, spotify_wine}.
	export TMUX_POWERLINE_SEG_NOW_PLAYING_MUSIC_PLAYER="spotify"
	# Maximum output length.
	export TMUX_POWERLINE_SEG_NOW_PLAYING_MAX_LEN="30"
	# How to handle too long strings. Can be {trim, roll}.
	export TMUX_POWERLINE_SEG_NOW_PLAYING_TRIM_METHOD="roll"
	# Charcters per second to roll if rolling trim method is used.
	export TMUX_POWERLINE_SEG_NOW_PLAYING_ROLL_SPEED="5"

	# Hostname for MPD server in the format "[password@]host"
	export TMUX_POWERLINE_SEG_NOW_PLAYING_MPD_HOST="localhost"
	# Port the MPD server is running on.
	export TMUX_POWERLINE_SEG_NOW_PLAYING_MPD_PORT="6600"

	# Username for Last.fm if that music player is used.
	export TMUX_POWERLINE_SEG_NOW_PLAYING_LASTFM_USERNAME=""
	# How often in seconds to update the data from last.fm.
	export TMUX_POWERLINE_SEG_NOW_PLAYING_LASTFM_UPDATE_PERIOD="30"
# }

# pwd.sh {
	# Maximum length of output.
	export TMUX_POWERLINE_SEG_PWD_MAX_LEN="40"
# }

# time.sh {
	# date(1) format for the time. Americans might want to have "%I:%M %p".
	export TMUX_POWERLINE_SEG_TIME_FORMAT="%H:%M"
# }

# weather.sh {
	# The data provider to use. Currently only "yahoo" is supported.
	export TMUX_POWERLINE_SEG_WEATHER_DATA_PROVIDER="yahoo"
	# What unit to use. Can be any of {c,f,k}.
	export TMUX_POWERLINE_SEG_WEATHER_UNIT="c"
	# How often to update the weather in seconds.
	export TMUX_POWERLINE_SEG_WEATHER_UPDATE_PERIOD="600"

	# Your location. Find a code that works for you:
	# 1. Go to Yahoo weather http://weather.yahoo.com/
	# 2. Find the weather for you location
	# 3. Copy the last numbers in that URL. e.g. "http://weather.yahoo.com/united-states/california/newport-beach-12796587/" has the numbers "12796587"
	export TMUX_POWERLINE_SEG_WEATHER_LOCATION="44418"
# }