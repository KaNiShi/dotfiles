XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
ZSH_CACHE_DIR=${ZSH_CACHE_DIR:-$XDG_CACHE_HOME/zsh}

__DOT_HOME="$XDG_DATA_HOME/dotfiles.zsh"

autoload -Uz add-zsh-hook

# Init Zinit
ZINIT_HOME="$XDG_DATA_HOME/zinit/zinit.git"
[ ! -d "$ZINIT_HOME" ] && mkdir -p "$(dirname "$ZINIT_HOME")"
[ ! -d "$ZINIT_HOME/.git" ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

[ -d "$__DOT_HOME/site-functions" ] && FPATH="$__DOT_HOME/site-functions:$FPATH"
[ -d "$__DOT_HOME/functions" ] && FPATH="$__DOT_HOME/functions:$FPATH"

[ -d "$XDG_DATA_HOME/zsh/site-functions" ] && FPATH="$XDG_DATA_HOME/zsh/site-functions:$FPATH"
[ -d "$XDG_DATA_HOME/zsh/functions" ] && FPATH="$XDG_DATA_HOME/zsh/functions:$FPATH"

__source() {
    typeset compiled="$1.zwc"
    if [[ ! -r "$compiled" || "$1" -nt "$compiled" ]]; then
        zcompile "$1"
    fi

    source "$1"
}

__source_snippet() {
    zinit ice lucid wait link; zinit snippet "$1"
}

if [ -d "$__DOT_HOME/rc.d" ]; then
    for i in "$__DOT_HOME/rc.d"/*.zsh; do
        if [ -r $i ]; then
            __source_snippet $i
        fi
    done
    unset i
fi

if [ -d "$XDG_DATA_HOME/.zsh/rc.d" ]; then
    for i in "$XDG_DATA_HOME/.zsh/rc.d"/*.zsh; do
        if [ -r $i ]; then
            __source_snippet $i
        fi
    done
    unset i
fi

zinit ice lucid wait; zinit snippet OMZL::git.zsh
zinit ice lucid wait; zinit snippet OMZP::git

zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit ice depth=1 lucid wait atinit'zicompinit; zicdreplay'; zinit light zdharma-continuum/fast-syntax-highlighting
zinit ice depth=1 lucid wait atload'_zsh_autosuggest_start'; zinit light zsh-users/zsh-autosuggestions

zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete _approximate _prefix
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path $ZSH_CACHE_DIR

[ -f "$__DOT_HOME/.p10k.zsh" ] && __source "$__DOT_HOME/.p10k.zsh"

unfunction __source __source_snippet
