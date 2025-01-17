# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS
HISTSIZE=100000
SAVEHIST=100000

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# ssh
#
zstyle ':zim:ssh' ids  'id_rsa' 'id_rsa_jenkins'

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# Homebrew
if [[ -f /opt/homebrew/bin/brew ]]; then
  echo "brew found: activating shellenv"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Openssl
if [[ -f $(brew --prefix openssl)/bin ]]; then
    echo "brew openssl found: pathing"
    export PATH=$(brew --prefix openssl)/bin:$PATH
fi

#
# Custom functions and aliases
#
if [[ -f ~/.zsh_functions ]]; then
  source ~/.zsh_functions
fi
if [[ -f ~/.zsh_aliases ]]; then
  source ~/.zsh_aliases
fi



# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install

if [[ -f $(brew --prefix asdf)/libexec/asdf.sh ]]; then
  echo "brew asdf found: activating"
  source $(brew --prefix asdf)/libexec/asdf.sh
fi
if [[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc" ]]; then
  source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
fi
if [[ -f ${HOME}/.asdf/plugins/java/set-java-home.zsh ]]; then
  source ${HOME}/.asdf/plugins/java/set-java-home.zsh
fi
if [[ -f $(brew --prefix mise)/bin/mise ]]; then
  echo "brew mise found: en placing"
  eval "$($(brew --prefix mise)/bin/mise activate zsh)"
fi
if [[ -f ~/.acme.sh/acme.sh.env ]]; then
  source ~/.acme.sh/acme.sh.env
fi
if [[ -f ~/.config/iterm2/.iterm2_shell_integration.zsh ]]; then
    source ~/.config/iterm2/.iterm2_shell_integration.zsh
fi
if [[ -f /opt/homebrew/bin/fzf ]]; then
  echo "brew fuzzy finder: found"
  eval "$(fzf --zsh)"
fi
if [[ -f /etc/ssl/certs/ca-certificates.crt ]]; then
  export REQUESTS_CA_BUNDLE='/etc/ssl/certs/ca-certificates.crt'
fi

# pnpm
export PNPM_HOME="/Users/gharper/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
