XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}

__DOT_HOME="$XDG_DATA_HOME/dotfiles.zsh"

# Enable Powerlevel10k instant prompt.
if [[ -r "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Init Zinit
ZINIT_HOME="$XDG_DATA_HOME/zinit/zinit.git"
[ ! -d "$ZINIT_HOME" ] && mkdir -p "$(dirname "$ZINIT_HOME")"
[ ! -d "$ZINIT_HOME/.git" ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

if [ -d "$__DOT_HOME/site-functions" ]; then
    export FPATH="$__DOT_HOME/site-functions:$FPATH"
fi

if [ -d "$__DOT_HOME/functions" ]; then
    export FPATH="$__DOT_HOME/functions:$FPATH"
fi

if [ -d "$XDG_DATA_HOME/zsh/site-functions" ]; then
    export FPATH="$XDG_DATA_HOME/zsh/site-functions:$FPATH"
fi

if [ -d "$XDG_DATA_HOME/zsh/functions" ]; then
    export FPATH="$XDG_DATA_HOME/zsh/functions:$FPATH"
fi

if [ -d "$__DOT_HOME/rc.d" ]; then
    for i in "$__DOT_HOME/rc.d"/*.zsh; do
        if [ -r $i ]; then
            () { source $i }
        fi
    done
    unset i
fi

if [ -d "$XDG_DATA_HOME/zsh/rc.d" ]; then
    for i in "$XDG_DATA_HOME/zsh/rc.d"/*.zsh; do
        if [ -r $i ]; then
            () { source $i }
        fi
    done
    unset i
fi

zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit ice depth=1; zinit light zsh-users/zsh-syntax-highlighting
zinit ice depth=1; zinit light zsh-users/zsh-autosuggestions
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git

zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete _approximate _prefix

autoload -Uz compinit && compinit -i

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
