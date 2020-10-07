[[ $- != *i* ]] && return

export LANG=en_US.utf8
export NNTPSERVER="news.epita.fr"
export EDITOR=vim
#for the sql month
export PGDATA="$HOME/postgres_data"
export PGHOST="/tmp"
term_size 14

setxkbmap -option caps:escape

alias ls='ls --color=auto'
alias lock='i3lock -l -i /home/baptiste.monfray/afs/image/OuterWildssize.png'
alias parrot='curl parrot.live'
alias deco='kill -9 -1'
alias vim='lock'
alias v="'vim'"
alias disco='echo ctrl+z to stop;while true; do sleep .1 ;xrandr --output DP-1 --gamma $((${RANDOM}%4+1)):$((${RANDOM}%4+1)):$((${RANDOM}%4+1));done;xrandr --output DP-1 --gamma 1:1:1;fg'
alias gg='g++ -fsanitize=address -std=c++17 -Wall -Wextra -Werror -pedantic'
alias tiger='cd ~/afs/Tiger'
alias tmake='cd ;rm -rf tiger-make;mkdir tiger-make;chmmod 700 tiger-make;cd tiger-make;ln -s ~/afs/Tiger/tests ./;~/afs/Tiger/configure CXXFLAGS=" -g3 -O0 -std=c++2a -pipe -fconcepts -fno-inline";ln -s /tmp/tiger-make/src/tc ~/afs/Tiger/src/'
alias bonsai='~/afs/Bonsai.sh -c "@","@","Ծ","&","&","&","&","&","&","&","&","&","&","&"'
alias bonlive='bonsai -l -i -w 1'

alias atom='~/atom-1.45.0-amd64/atom'

bonsai -g 50,25

#get afs quota : fs quota ~/afs
#top 20 biggest file in asf : du -h afs/ | sort -n -r | head -n 20

#PS1='[\u@\h \W]\$'
#PS1='\[\e[32m\]¯\_( ͡° ͜ʖ ͡°)_/¯\[\e[m\]\n\[\e[36m\][baba \W]\$ \[\e[m\]'

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1="\[\e[0;35m\]╭─\[\e[0m\]\`if [ \$? -eq 0 ];then echo \e[0\;32m☭ƁаƄа \e[0m;else echo \e[0\;31m\(✖╭╮✖\)\e[0m; fi\`\[\e[0;36m\][\w]\[\e[0m\] \[\e[91m\]\$(parse_git_branch)\[\e[00m\]\n\[\e[0;35m\]╰➤\[\e[0m\]\$ "

stty -ixon
