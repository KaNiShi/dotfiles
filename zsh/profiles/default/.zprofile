export EDITOR=vim

XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

__DOT_HOME="$XDG_DATA_HOME/dotfiles.zsh"

[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

for i in "$__DOT_HOME/profile.d"/*.zsh; do
    () { source $i }
done
unset i

if [ -d "$XDG_DATA_HOME/.zsh/profile.d" ]; then
    for i in "$XDG_DATA_HOME/.zsh/profile.d"/*.zsh; do
        () { source $i }
    done
    unset i
fi
