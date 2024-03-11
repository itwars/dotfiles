#COLORWHEEL=( $( seq 27 -1 22 ) $( seq 28 33) $( seq 39 -1 34 ) $( seq 40 45 ) $( seq 51 -1 46 ) $( seq 82 87 ) $( seq 81 -1 76 ) $( seq 70 75 ) $( seq 69 -1 64 ) $( seq 58 63 ) $( seq 57 -1 52 ) $( seq 88 93 ) $( seq 99 -1 94 ) $( seq 100 105 ) $( seq 111 -1 106 ) $( seq 112 117 ) $( seq 123 -1 118 ) $( seq 154 159 ) $( seq  153 -1 148 ) $( seq 142 147 ) $( seq 141 -1 136 ) $( seq 130 135 ) $( seq 129 -1 124 ) $( seq 160 165 ) $( seq 171 -1 166 ) $( seq 172 177 ) $( seq 183 -1 178 ) $( seq 184 189 ) $( seq 195 -1 190 ) $( seq 226 231 ) $( seq 225 -1 220 ) $( seq 214 219 ) $( seq 213 -1 208 ) $( seq 202 207 ) $( seq 201 -1 196 ) $( seq 160 165 ) 129 93 99 105 111 117 123 51 45 39 33 ) 
#
##COLORWHEEL=( 17 18 19 20 21 124 160 161 162 163 164 165 171 196 197 198 199 200 201 207 ) 
#
#WHEELLENGTH=${#COLORWHEEL[@]}
#COLCOUNT=$(( $RANDOM ))
#function change_colors
#{
#   FIRSTPROMPT=`echo $(echo -e "┌") $(pwd) $(git_branch)`
#   FIRSTLENGTH=${#FIRSTPROMPT}
#   SECONDPROMPT=`echo $(echo -e "└")$(echo -e "契") $(echo $USER@$HOSTNAME) $(echo -e "契")`
#   SECONDLENGTH=${#SECONDPROMPT}
#   COLOR=$(( $COLCOUNT % $WHEELLENGTH ))
#   FINAL1=''
#   FINAL2=''
#   i=0
#   while [ "$i" -le "$FIRSTLENGTH" ]; do
#      CURRCOLOR=$(( ( $COLOR + $i ) % $WHEELLENGTH))
#      FINAL1+="\[\033[38;5;${COLORWHEEL[$CURRCOLOR]}m\]${FIRSTPROMPT:$i:1}"
#      i=$(($i + 1))
#   done
#   j=0
#   while [ "$j" -le "$SECONDLENGTH" ]; do
#      CURRCOLOR=$(( ( $COLOR + $j + 1 ) % $WHEELLENGTH))
#	FINAL2+="\[\033[38;5;${COLORWHEEL[$CURRCOLOR]}m\]${SECONDPROMPT:$j:1}"
#      j=$(($j + 1))
#   done
#   COLCOUNT=$(( $COLCOUNT + 1 ))
#   PS1="${debian_chroot:+($debian_chroot)}${FINAL1}\n\[$(tput bold)\]${FINAL2} \[\e[0m\]"
#}
#PROMPT_COMMAND="change_colors;$PROMPT_COMMAND"
OS_ICON=   # Replace this with your OS icon
#PS1="\n \[\033[0;34m\]╭─────\[\033[0;31m\]\[\033[0;37m\]\[\033[41m\] $OS_ICON \u \[\033[0m\]\[\033[0;31m\]\[\033[0;34m\]─────\[\033[0;32m\]\[\033[0;30m\]\[\033[42m\] \w \[\033[0m\]\[\033[0;32m\] \n \[\033[0;34m\]╰ \[\033[1;36m\]\$ \[\033[0m\]"

#yellowText="\[\e[38;2;0;254;0m\]"
#blackBg="\[\e[48;2;252;3;107m\]"
#reset="\[\e[m\]"

#PS1="\n ${yellowText}${blackBg}$OS_ICON \u \w ${reset}"

PS1="\n \[$(tput setaf 9)\]╭─────\[$(tput setaf 9)\]\[$(tput setaf 9)\] $OS_ICON \[$(tput setab 9)\] \u \[\033[0m\]\[$(tput setaf 9)\]\[$(tput setaf 9)\]─────\[\033[0;32m\]\[\033[0;30m\]\[\033[42m\] \w \[\033[0m\]\[\033[0;32m\] \n \[$(tput setaf 9)\]╰ \[\033[1;36m\]\$ \[\033[0m\]"
#PS1="\[$(tput setaf 164)\]\[$(tput setab 164)\]\u─────\[$(tput setaf 220)\]\[$(tput setaf 214)\]\h \[$(tput setaf 33)\]\w \[$(tput sgr0)\]$ "
#
#
#export POSH_THEME=''
#export POSH_SHELL_VERSION=$BASH_VERSION
#export POWERLINE_COMMAND="oh-my-posh"
#export POSH_PID=$$
#export CONDA_PROMPT_MODIFIER=false
#omp_start_time=""
#
## start timer on command start
#PS0='${omp_start_time:0:$((omp_start_time="$(_omp_start_timer)",0))}'
## set secondary prompt
#PS2="$(/usr/local/bin/oh-my-posh print secondary --config="$POSH_THEME" --shell=bash --shell-version="$BASH_VERSION")"
#
#function _set_posh_cursor_position() {
#      # not supported in Midnight Commander
#    # see https://github.com/JanDeDobbeleer/oh-my-posh/issues/3415
#    if [[ "false" != "true" ]] || [[ -v MC_SID ]]; then
#        return
#    fi
#
#    local oldstty=$(stty -g)
#    stty raw -echo min 0
#
#    local COL
#    local ROW
#    IFS=';' read -sdR -p $'\E[6n' ROW COL
#
#    stty $oldstty
#
#    export POSH_CURSOR_LINE=${ROW#*[}
#    export POSH_CURSOR_COLUMN=${COL}
#}
#
#function _omp_start_timer() {
#    /usr/local/bin/oh-my-posh get millis
#}
#
## template function for context loading
#function set_poshcontext() {
#    return
#}
#
#function _omp_hook() {
#    local ret=$?
#    local omp_stack_count=$((${#DIRSTACK[@]} - 1))
#    local omp_elapsed=-1
#    if [[ -n "$omp_start_time" ]]; then
#        local omp_now=$(/usr/local/bin/oh-my-posh get millis --shell=bash)
#        omp_elapsed=$((omp_now-omp_start_time))
#        omp_start_time=""
#    fi
#    set_poshcontext
#    _set_posh_cursor_position
#    PS1="$(/usr/local/bin/oh-my-posh print primary --config="$POSH_THEME" --shell=bash --shell-version="$BASH_VERSION" --error="$ret" --execution-time="$omp_elapsed" --stack-count="$omp_stack_count" | tr -d '\0')"
#    return $ret
#}
#
#if [ "$TERM" != "linux" ] && [ -x "$(command -v /usr/local/bin/oh-my-posh)" ] && ! [[ "$PROMPT_COMMAND" =~ "_omp_hook" ]]; then
#    PROMPT_COMMAND="_omp_hook; $PROMPT_COMMAND"
#fi
#
#if [ "false" == "true" ]; then
#    echo ""
#fi
