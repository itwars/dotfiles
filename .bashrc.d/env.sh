if [ "$PS1" != "" -a "${STARTED_TMUX:-x}" = x -a "${SSH_TTY:-x}" != x ]
then
    STARTED_TMUX=1; export STARTED_TMUX
    sleep 1
    ( (tmux -2 has-session -t remote && tmux -2 attach-session -t remote) || (tmux -2 new-session -s remote) ) && exit 0
        echo "tmux failed to start"
fi
