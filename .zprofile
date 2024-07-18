export EDITOR=vim
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

__DOT_HOME="$XDG_DATA_HOME/dotfiles.zsh"

[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

if [ -d "$__DOT_HOME/profile.d" ]; then
    for i in "$__DOT_HOME/profile.d"/*.zsh; do
        if [ -r $i ]; then
            () { source $i }
        fi
    done
    unset i
fi

if [ -d "$XDG_DATA_HOME/zsh/profile.d" ]; then
    for i in "$XDG_DATA_HOME/zsh/profile.d"/*.zsh; do
        if [ -r $i ]; then
            () { source $i }
        fi
    done
    unset i
fi
