if [[ -f /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
export PATH=$(brew --prefix openssl)/bin:$PATH
# Added by Toolbox App
export PATH="$PATH:/usr/local/bin"

if command -v pyenv 1>/dev/null 2>&1
then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

if [[ -f ${HOME}/.ssh/gharper_ansible_vault ]]; then
  export ANSIBLE_VAULT_PASSWORD_FILE="${HOME}/.ssh/gharper_ansible_vault"
fi
