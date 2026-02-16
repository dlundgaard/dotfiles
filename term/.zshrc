
autoload -U colors && colors
autoload -Uz compinit && compinit
setopt INC_APPEND_HISTORY
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

CASE_SENSITIVE="false"
PROMPT="(%n@%m)-[%(4~|.../%3~|%~)] "

if [[ $- == *i* ]] # if in interactive shell
then
     # load aliases
    [ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

    # initialize fuzzy finder
    source <(fzf --zsh)
    bindkey "ç" fzf-cd-widget
    bindkey "ƒ" fzf-file-widget
fi

