
if [[ $- == *i* ]] # if in interactive shell
then
     # load aliases
    [ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

    source <(fzf --zsh)

    # add rust binaries to path
    [ -f "~/.cargo/env" ] && source "~/.cargo/env"
fi

autoload -Uz compinit && compinit
autoload -U colors && colors
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
CASE_SENSITIVE="false"

PROMPT="(%n@%m)-[%~] "
