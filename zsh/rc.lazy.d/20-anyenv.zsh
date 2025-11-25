if (( $+commands[anyenv] )); then
    eval "$(anyenv init-cache-load)"

    if (( $+commands[nodenv] )); then
        NODENV_ROOT="$(nodenv root)"
        [ -d "$NODENV_ROOT/completions" ] && FPATH="$NODENV_ROOT/completions:$FPATH"
    fi
fi
