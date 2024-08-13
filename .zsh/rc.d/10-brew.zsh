if (( $+commands[brew] )); then
    export FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
fi
