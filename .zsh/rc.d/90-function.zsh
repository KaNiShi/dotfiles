if [ -d '/run/WSL' ]; then
    fix_wsl2_interop() {
        for i in $(pstree -np -s $$ | grep -o -E '[0-9]+'); do
            if [[ -e "/run/WSL/${i}_interop" ]]; then
                export WSL_INTEROP=/run/WSL/${i}_interop
            fi
        done
    }

    explorer() {
        explorer.exe $1
        return 0
    }
fi

if (( $+commands[aws] )); then
    asp() {
        if [[ -z "$1" ]]; then
            unset AWS_PROFILE
            echo AWS profile cleared.
        return
        fi

        export AWS_PROFILE=$1
    }
fi
