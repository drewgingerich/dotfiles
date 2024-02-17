set -x AWS_VAULT_DEFAULT_PROFILE engineer
set -x AWS_VAULT_KEYCHAIN_NAME login
set -x AWS_REGION us-east-1
set -x AWS_ASSUME_ROLE_TTL 1h
set -x AWS_SESSION_TTL 12h
set -x AWS_FEDERATION_TOKEN_TTL 12h
set -x AWS_SDK_LOAD_CONFIG true

function avs-down
    set -e AWS_VAULT
    sudo killall aws-vault
end

function avs-up
    avs-down
    aws-vault exec --server --prompt=osascript engineer
end
