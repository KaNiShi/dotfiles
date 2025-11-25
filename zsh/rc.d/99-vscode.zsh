# terminal.integrated.shellIntegration.enabled がtrueの場合は初期化を行わない
if [ -n "$VSCODE_INJECTION" ]; then
    return
fi

[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"
