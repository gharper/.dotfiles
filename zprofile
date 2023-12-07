# Homebrew
if [[ -f /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Openssl
if [[ -f $(brew --prefix openssl)/bin ]]; then
    export PATH=$(brew --prefix openssl)/bin:$PATH
fi

# Go Jira
if [[ -f /opt/homebrew/bin/jira ]]; then
  eval "$(jira --completion-script-zsh)"
fi

if [[ -f ${HOME}/dev/bin ]]; then
    export PATH="$PATH:${HOME}/dev/bin"
fi

if [[ -f /etc/ssl/certs/ca-certificates.crt ]]; then
  export REQUESTS_CA_BUNDLE='/etc/ssl/certs/ca-certificates.crt'
fi
