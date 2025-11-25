export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"

export TERMINAL_PROFILE="${TERMINAL_PROFILE:-default}"

__DOT_HOME="$XDG_DATA_HOME/dotfiles.zsh"

# Disable Ubuntu compinit
skip_global_compinit=1

case "${TERMINAL_PROFILE}" in
    COPILOT)
        ZDOTDIR="${__DOT_HOME}/profiles/copilot"
        ;;
    *)
        ZDOTDIR="${__DOT_HOME}/profiles/default"
        ;;
esac
