if (( $+commands[brew] )); then
    export FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"

    case "$OSTYPE" in
        darwin*)
            now="$(date -v -1d +%s)"
            ;;
        *)
            now="$(date -d '-1 day' +%s)"
            ;;
    esac
    if [ "$(date -r "$(brew --repository)" +%s)" -lt "$now" ]; then
        brew update
        touch "$(brew --repository)"
    fi
fi
