if [ -x "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
    BREW_PATH="/home/linuxbrew/.linuxbrew/bin/brew"
elif [ -x "/opt/homebrew/bin/brew" ]; then
    BREW_PATH="/opt/homebrew/bin/brew"
elif [ -x "/usr/local/bin/brew" ]; then
    BREW_PATH="/usr/local/bin/brew"
fi

if [ -n "${BREW_PATH:+1}" ]; then
    eval "$("$BREW_PATH" shellenv zsh)"
fi
