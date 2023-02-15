# Change prefix key to C-a
unbind C-b
set -g prefix C-a

# Quick jump to last window
bind-key C-a last-window

# User proper shell
set-option -g default-shell $SHELL

# Don't lose ENV
set -ga update-environment ' ITERM_PROFILE TMUX_STATUS_LEFT'
set-window-option -g mode-keys vi

## keybindings
unbind C-b
unbind C-a
unbind ,
unbind .
unbind n
unbind p
unbind [
unbind '"'
unbind l
unbind &
unbind %

# Don't wait for anyone (Prevent pauses in Vim, etc)
set -s escape-time 0

# Use Vi mode
set -g mode-keys vi
set -g status-keys vi

# mouse support
set -g mouse on
set-option -g status on
set-option -g status-interval 2
set-option -g status-justify centre
set-option -g status-left-length 220
set-option -g status-right-length 220

# Start window numbering at 1
set -g base-index 1

# Copy mode more vim like
bind Escape copy-mode
unbind p
bind p paste-buffer
#bind -t vi-copy 'v' begin-selection
#bind -t vi-copy 'y' copy-selection

#bind  +    resize-pane -Z
#bind  =    resize-pane -Z
bind  |    split-window -h -c "#{pane_current_path}"
bind  \    split-window -h -c "#{pane_current_path}"
bind  -    split-window -v -c "#{pane_current_path}"
bind  c    new-window -c "#{pane_current_path}"

# easily toggle synchronization (mnemonic: e is for echo)
# sends input to all panes in a given window.
bind e setw synchronize-panes on
bind E setw synchronize-panes off

bind  u    select-window -t :1
bind  W    split-window -h \; choose-window 'kill-pane ; join-pane -hs %%'
bind  x    kill-pane
bind  X    kill-window
bind  q    confirm-before kill-session
bind  Q    confirm-before kill-server

bind  ,    previous-window # <
bind  .    next-window     # >
bind -n C-Right next-window
bind -n C-Left  previous-window

# Make the current window the first window
bind  T    swap-window -t 1
bind  <    swap-window -t :-
bind  >    swap-window -t :+

bind  n    command-prompt 'rename-window "%%"'
bind  N    command-prompt 'rename-session "%%"'

# Reload config
bind  r    source-file ~/.tmux.conf \; display "Reloaded tmux config."
bind  R    refresh-client

# Smart pane switching with awareness of vim splits
bind -n C-h run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-h) || tmux select-pane -L"
bind -n C-j run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-j) || tmux select-pane -D"
bind -n C-k run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-k) || tmux select-pane -U"
bind -n C-l run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-l) || tmux select-pane -R"
bind -n C-\ run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys 'C-\\') || tmux select-pane -l"

# Terminal emulator window title
set -g set-titles on
set -g set-titles-string '#S:#I.#P #W'

# History limit
set -g history-limit 10000

# Notifying if other windows has activities
setw -g monitor-activity on
set -g visual-activity on

# Rather than constraining window size to the maximum size of any client
# connected to the *session*, constrain window size to the maximum size of any
# client connected to *that window*. Much more reasonable.
setw -g aggressive-resize on

# "I' == current window index
# 'H' == Hostname
# 'F' == current window flag
# 'P' == current pane index
# 'S' == Session name
# 'T' == current window title
# 'W' == current window name
# '#' == a literal "#"
# Where appropriate, special character sequences may be prefixed with a
# number to specify the maximum length, in this line "#10W'.
set -g status-left " "
set-option -g status-right '#[fg=red]#S#[fg=default] [#I:#P] #[fg=default]%a %d %b %H:%M'

set-option -g status-right-length 100
set-option -g status-left-length 120

# Highlighting the active window in status bar
setw -g window-status-current-bg blue

# Highlight active window
set-window-option -g window-status-current-fg white
set-window-option -g window-status-current-attr bold
set-window-option -g window-status-current-bg default

set-option -g status-position bottom # position the status bar at bottom of screen

# change the central status element colours here
set-window-option -g window-status-current-format "#[fg=colour234, bg=colour145]⇒#[fg=colour234, bg=colour145] #I #W #[fg=colour145, bg=colour234]"

# default statusbar colors
set-option -g status-bg colour234 #base02
set-option -g status-fg colour130 #yellow
set-option -g status-attr default

#set-option -g status-left "#(~/.tmux-powerline/powerline.sh left)"
#set-option -g status-right "#(~/.tmux-powerline/powerline.sh right)"
# default statusbar colors
set-option -g status-bg colour234 #base02
set-option -g status-fg colour130 #yellow
set-option -g status-attr default

# default window title colors
set-window-option -g window-status-fg colour8 #base0
set-window-option -g window-status-bg colour234
set-window-option -g window-status-attr dim

# active window title colors
#set-window-option -g window-status-current-fg colour196 #orange
#set-window-option -g window-status-current-bg colour234
#set-window-option -g window-status-current-attr bright

# pane border
set-option -g pane-border-fg colour234 #base02
set-option -g pane-active-border-fg colour226 #base01

# message text
set-option -g message-bg colour234 #base02
set-option -g message-fg colour196 #orange

# pane number display
set-option -g display-panes-active-colour colour20 #blue
set-option -g display-panes-colour colour196 #orange

# clock
set-window-option -g clock-mode-colour colour40 #green

# renumber windows automatically
set-option -g renumber-windows on

# switch panes using Alt-arrow without prefix
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# don't let ZSH override the window title
set-window-option -g allow-rename on

# renumber windows
set-option -g renumber-windows on

# tmux window titling for X
set-option -g set-titles on
set-option -g set-titles-string '#S'

set-window-option -g window-status-format ' #I #W '
set-window-option -g window-status-attr dim

# Terminal junks!
set -g default-terminal "screen-256color"
set -g terminal-overrides "*88col*:colors=88,*256col*:colors=256"
set-option -ga terminal-overrides ",xterm-256color:Tc"
set-option -g default-terminal "screen-256color"
