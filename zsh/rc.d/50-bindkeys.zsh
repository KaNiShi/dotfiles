typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

__addbinding() {
    (( ! $+functions[$2] )) && autoload -Uz "$2"
    (( ! $+widgets[$2] )) && zle -N "$2"
    bindkey "$1" "$2"
}

# Set Emacs style
bindkey -e

# Mapping bindings
__addbinding "^[[1;5C" forward-word
__addbinding "^[[1;5D" backward-word
__addbinding "^[[3~" delete-char

__addbinding "^[[A" up-line-or-beginning-search
[[ -n "${key[Up]}" ]] && __addbinding ${key[Up]} up-line-or-beginning-search

__addbinding "^[[B" down-line-or-beginning-search
[[ -n "${key[Down]}" ]] && __addbinding ${key[Down]} down-line-or-beginning-search

if (( $+commands[fzf] )); then
    __addbinding "^F" fzf-cdr-selection
    __addbinding "^R" fzf-history-selection
elif (( $+commands[peco] )); then
    __addbinding "^F" peco-cdr-selection
    __addbinding "^R" peco-history-selection
fi

# Cleanup
unfunction __addbinding
