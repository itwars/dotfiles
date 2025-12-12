alias ls='ls'
alias ll='ls -alh'
alias tmux-stop='tmux kill-server'
alias weather='curl wttr.in/Bordeaux'
alias hugo-server="hugo server --watch --disableFastRender --bind 0.0.0.0 --baseURL http://$(ifconfig|grep 'inet '|grep -v '127.0.0.1'|awk '{print $2}')"
alias grep='grep --color=auto'
alias pro='cd ~/Documents/projects'
alias web='python3 -m http.server 8000 --bind 0.0.0.0'
alias alpine='docker run -it --rm -v $(pwd)/:/tmp/host -p 8000:8000 -p 8000:8000/udp -p 8001:8001 -p 8001:8001/udp --hostname=alpine alpine:latest /bin/sh'
alias debian='docker run -it --rm -v $(pwd)/:/tmp/host -p 8000:8000 --hostname=debian debian:latest /bin/bash'
alias ubuntu='docker run -it --rm -v $(pwd)/:/tmp/host -p 8000:8000 --hostname=ubuntu ubuntu:latest /bin/bash'
alias radio-rpbfm="mplayer http://www.rpbfm.fr:8000/stream -cache 5000"
alias radio-intense="mplayer http://secure.live-streams.nl/flac.flac -cache 5000"
alias radio-paradise="mplayer http://stream-dc1.radioparadise.com/aac-320 -cache 5000"
alias vi="nvim"
