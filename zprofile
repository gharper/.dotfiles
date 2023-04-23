export PATH="$PATH:/usr/local/bin"

# Homebrew
if [[ -f /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Openssl
if [[ -f $(brew --prefix openssl)/bin ]]; then
    export PATH=$(brew --prefix openssl)/bin:$PATH
fi

# Ansible
if [[ -f ${HOME}/.ssh/gharper_ansible_vault ]]; then
  export ANSIBLE_VAULT_PASSWORD_FILE="${HOME}/.ssh/gharper_ansible_vault"
fi

if [[ -f ${HOME}/dev/bin ]]; then
    export PATH="$PATH:${HOME}/dev/bin"
fi

# if [[ -f ]]; then
# fi
