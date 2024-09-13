case "$OSTYPE" in
    darwin*)
        alias ls='ls -G'
        ;;
    *)
        alias ls='ls --color=auto'
        ;;
esac
