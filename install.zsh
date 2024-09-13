#!/bin/env zsh

set -eu

XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
_SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd -P)"

echo '### Backup exists files. ###'
NOW=$(date +%Y%m%d%H%M%S)
[[ -f "$HOME/.zshrc" && ! -L "$HOME/.zshrc" ]] && mv -v "$HOME/.zshrc" "$HOME/.zshrc"
[[ -f "$HOME/.zprofile" && ! -L "$HOME/.zprofile" ]] && mv -v "$HOME/.zprofile" "$HOME/.zprofile.$NOW"

if [ ! -d "$XDG_DATA_HOME" ]; then
    echo "Create $XDG_DATA_HOME"
    mkdir -p "$XDG_DATA_HOME"
fi

echo '### Install dotfiles. ###'
ln -vnsf "$_SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
ln -vnsf "$_SCRIPT_DIR/.zprofile" "$HOME/.zprofile"
ln -vnsf "$_SCRIPT_DIR/zsh" "$XDG_DATA_HOME/dotfiles.zsh"

if (( $+commands[anyenv] )); then
    ANYENV_ROOT="$(anyenv root)"
    [ ! -d "$ANYENV_ROOT/plugins" ] && mkdir -pv "$ANYENV_ROOT/plugins"
    ln -vnsf "$_SCRIPT_DIR/utils/anyenv/anyenv-init-cache" "$ANYENV_ROOT/plugins/anyenv-init-cache"
fi

echo '### Remove oldfiles. ###'
[ -L "$HOME/.p10k.zsh" ] && unlink "$HOME/.p10k.zsh" && echo "Unlinked: $HOME/.p10k.zsh"

echo '\e[32mInstall success.\e[m'
