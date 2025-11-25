zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete _approximate _prefix
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path $ZSH_CACHE_DIR
