alias ls='ls -G'
alias ll='ls -alh'
alias tmux-stop='tmux kill-server'
alias weather='curl wttr.in/Bordeaux'
alias airodump='sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
alias dry='docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock moncho/dry'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias hugo-server="hugo server --watch --disableFastRender --bind 0.0.0.0 --baseURL http://$(ifconfig|grep 'inet '|grep -v '127.0.0.1'|awk '{print $2}')"
alias grep='grep --color=auto'
alias pro='cd ~/Documents/projects'
alias scpr='rsync --rsh=ssh -av --progress --partial'
alias web='python3 -m http.server 8000 --bind 0.0.0.0'
alias listdisk='diskutil list'
alias alpine='docker run -it --rm -v $(pwd)/:/tmp/host -p 8000:8000 -p 8000:8000/udp -p 8001:8001 -p 8001:8001/udp --hostname=alpine alpine:latest /bin/sh'
alias debian='docker run -it --rm -v $(pwd)/:/tmp/host -p 8000:8000 --hostname=debian debian:latest /bin/bash'
alias ubuntu='docker run -it --rm -v $(pwd)/:/tmp/host -p 8000:8000 --hostname=ubuntu ubuntu:latest /bin/bash'
alias centos='docker run -it --rm -v $(pwd)/:/tmp/host -p 8000:8000 --hostname=centos centos:7 /bin/bash'
alias radio-rpbfm="mplayer http://www.rpbfm.fr:8000/stream -cache 5000"
alias radio-intense="mplayer http://secure.live-streams.nl/flac.flac -cache 5000"
alias radio-paradise="mplayer http://stream-dc1.radioparadise.com/aac-320 -cache 5000"
alias virus-stop="sudo launchctl unload /Library/LaunchDaemons/com.trendmicro.*"
#alias brew_today='brew list -1tl 2> /dev/null | grep "$(LC_TIME="us_US.UTF-8"  date +"%b %d")" | awk '"'"'{print $NF}'"'"''
#alias docker="podman"
alias wgup="sudo wg-quick up wg0"
alias wgdown="sudo wg-quick down wg0"
alias vi="nvim"
alias colima-start="colima start --cpu 2 --memory 3 --disk 30"
