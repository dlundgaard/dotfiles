
if [[ $- == *i* ]] # if in interactive shell
then
    # disable <Ctrl+S> to freeze/pause terminal 
    stty -ixon

    # append to the history file, don't overwrite it
    shopt -s histappend

    # load aliases
    [ -f ~/.bash_aliases ] && source ~/.bash_aliases

    # launch autojump
    [ -f /usr/share/autojump/autojump.sh ] && source /usr/share/autojump/autojump.sh

    # launch fuzzyfinder
    [ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash

    # add rust binaries to path
    [ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
fi

# setting history size and path truncation
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth:erasedups
PROMPT_DIRTRIM=3

# definition of colors
WHITE="\[\e[;37m\]"
BLUE="\[\e[1;34m\]"
TEAL="\[\e[;32m\]"
NEUTRAL="\[\e[;37m\]"
USER_COLOR=$NEUTRAL
DIR_COLOR=$NEUTRAL
BRACKET_COLOR=$TEAL
PROMPT_COLOR=$NEUTRAL
ENV_COLOR="\[\e];\W\a\]"

# setting prompt-string
PS1="$ENV_COLOR$NEUTRAL$VIRTUAL_ENV$BRACKET_COLOR($USER_COLOR\u@\h$BRACKET_COLOR)-[$DIR_COLOR\w$BRACKET_COLOR]-$PROMPT_COLOR\$ " 
export BASH_SILENCE_DEPRECATION_WARNING=1

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/Users/dlundgaard/.juliaup/bin:*)
        ;;

    *)
        export PATH=/Users/dlundgaard/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<
