#!/bin/env zsh

set -eu

XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
ZSH_CACHE_DIR=${ZSH_CACHE_DIR:-$XDG_CACHE_HOME/zsh}

_SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd -P)"

echo '### Backup exists files. ###'
NOW=$(date +%Y%m%d%H%M%S)
[[ -f "$HOME/.zshenv" && ! -L "$HOME/.zshenv" ]] && mv -v "$HOME/.zshenv" "$HOME/.zshenv.$NOW"

echo '### Create directories. ###'
if [ ! -d "$XDG_DATA_HOME" ]; then
    mkdir -vp "$XDG_DATA_HOME"
fi

if [ ! -d "$ZSH_CACHE_DIR" ]; then
    mkdir -vp "$ZSH_CACHE_DIR"
fi

echo '### Install dotfiles. ###'
ln -vnsf "$_SCRIPT_DIR/.zshenv" "$HOME/.zshenv"
ln -vnsf "$_SCRIPT_DIR/zsh" "$XDG_DATA_HOME/dotfiles.zsh"

if (( $+commands[anyenv] )); then
    ANYENV_ROOT="$(anyenv root)"
    [ ! -d "$ANYENV_ROOT/plugins" ] && mkdir -pv "$ANYENV_ROOT/plugins"
    ln -vnsf "$_SCRIPT_DIR/utils/anyenv/anyenv-init-cache" "$ANYENV_ROOT/plugins/anyenv-init-cache"
fi

echo '\e[32mInstall success.\e[m'
