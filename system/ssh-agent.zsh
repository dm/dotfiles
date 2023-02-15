# Predictable SSH authentication socket location.
SOCK="$HOME/.ssh/agent_sock"
AGENT_ENV="$HOME/.ssh/agent_env"
if ! ps -x | fgrep -v fgrep | fgrep -q $SOCK;
then
    rm -f $SOCK
    ssh-agent -a $SOCK > $AGENT_ENV
fi
eval $(cat $AGENT_ENV)
