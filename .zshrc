export ZSH="/home/longkl/.oh-my-zsh"

ZSH_THEME="kardan"

plugins=(history-substring-search zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

bindkey -v
bindkey '^ ' autosuggest-accept
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd)

zstyle ':completion:*-case' menu select=5
zstyle ':completion:*:history-words'    menu yes

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

alias br="git branch"
alias gt="git diff --staged"
alias gs="git show"

if [ "$(whoami)" = "longkl" ]; then
    if [ -z $TMUX ]; then
            if tmux has -t work > /dev/null 2>&1; then
                    if [ 0 -eq `tmux lsc -t work 2>/dev/null | wc -l` ]; then
                            echo attach
                            tmux -2 attach -t work

                    else
                            echo "create new. work window is working now "
                            tmux -2 new
                    fi
            else
                    echo "create new session with work window"
                    tmux -2 new -t work
            fi
    fi
    export TMUX_AUTO_STARTUP=1
fi

