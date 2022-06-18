
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

serve() {
    port=${1:-80}
    sudo python3 -m http.server $port
}

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

disk_usage() {
    du -hd0 "$1"
}

cut_video () {
    ffmpeg -i "$1" -ss $2 -to $3 -c:v copy -c:a copy $4.mp4
}
