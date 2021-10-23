
# naming useful directories
export WINHOME="/mnt/c/Users/dl"
export TRASH_CAN="$HOME/.local/trash"

# setting aliases
alias grep="grep --color"
alias lt="ls -alhr --color --sort=time"
alias rm="rm -i"
alias mv="mv -i"
alias py="python"
alias cdw="cd $WINHOME"

# cd to Windows (WSL) path 
wcd() {
    cd "$(wslpath "$1")"
}

# custom functions
trash() {
    mkdir -p $TRASH_CAN
    echo ""$1" -> $TRASH_CAN"
    mv -t $TRASH_CAN $1
}

# download sound from youtube-video
yt-audio() {
    youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 -f 251 "$1"
}
