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

    aws_sts-assume-role-with-saml() {
        aws_sts_credentials_set "$1" "$(aws sts assume-role-with-saml --role-arn "$2" --principal-arn "$3" --saml-assertion "$4")"
    }

    aws_sts_credentials_set() {
        read access secret session <<< $(echo "$2" | jq -r '.Credentials | [ .AccessKeyId, .SecretAccessKey, .SessionToken] | join(" ")')
        aws configure set --profile "$1" aws_access_key_id "$access"
        aws configure set --profile "$1" aws_secret_access_key "$secret"
        aws configure set --profile "$1" aws_session_token "$session"
        echo "Credentials set to $1."
    }
fi
