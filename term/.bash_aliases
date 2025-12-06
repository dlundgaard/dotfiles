
# naming useful directories
export WINHOME="/mnt/c/Users/dl"
export TRASH_CAN="$HOME/.local/trash"

# enable opening files in default Windows app with xdg-open
export BROWSER="powershell.exe /C start"

 #setting aliases
alias grep="grep --color"
alias lt="ls -alhr --color -t"
alias rm="rm -i"
alias mv="mv -i"
alias n="nnn"
alias lg="lazygit"
alias python="python.exe"
alias pip="pip.exe"
alias py="python"
alias uv="uv.exe"
alias r="R --no-save"
alias yt="yt-dlp"
alias youtube-dl="yt-dlp"
alias cdw="cd $WINHOME"

fonts() {
    fc-list : family | sort | uniq
}

serve() {
    port=${1:-80}
    sudo python3 -m http.server $port
}

# cd to Windows (WSL) path 
todir() {
    cd "$(dirname "$(wslpath -u "$1")")"
}

# custom functions
trash() {
    mkdir -p $TRASH_CAN
    echo ""$1" -> $TRASH_CAN"
    mv -t $TRASH_CAN $1
}

# download sound from youtube-video
tomp3() {
    yt-dlp.exe --extract-audio --audio-format mp3 --audio-quality 0 -f 251 "$1"
}

disk_usage() {
    du -hd0 "$1"
}

cut_video() {
    ffmpeg -i "$1" -ss $2 -to $3 -c:v copy -c:a copy $4.mp4
}

pagecount() {
    pdftotext "$1" - | echo "$(expr $(wc -m) / 2400) (standard) pages"
}
