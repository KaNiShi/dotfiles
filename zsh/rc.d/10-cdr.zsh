autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs

zstyle ':chpwd:*' recent-dirs-max 1000
zstyle ':chpwd:*' recent-dirs-file "${ZSH_CACHE_DIR}/chpwd-recent-dirs"
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':completion:*' recent-dirs-insert both
