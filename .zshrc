# Executes commands at the start of an interactive session.
##############################################################
# => Start Xorg Server
##############################################################
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx
fi

##############################################################
# => Source ZPREZTO Config
##############################################################
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

##############################################################
# => Export Global Environments Variable
##############################################################
export VISUAL='nvim'
export EDITOR='nvim'

# Custom binary paths. zsh's unique array keeps PATH stable and duplicate-free.
typeset -U path PATH
path=(
  /opt/homebrew/bin
  "$HOME/.local/bin"
  /usr/local/bin
  /usr/bin
  /bin
  "$HOME/.jenv/bin"
  "$HOME/.jenv/shims"
  "$HOME/.pyenv/bin"
  "$HOME/.pyenv/shims"
  "$HOME/.cargo/bin"
  "$HOME/.asdf/shims"
  $path
)
export PATH

# AWS path
export AWS_CONFIG_FILE="$HOME/.aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$HOME/.aws/credentials"

# GO path
export GOPATH="$HOME/Golang"
export GOBIN="$GOPATH/bin"
export GOCACHE="$HOME/.cache"
export GO111MODULE=on
export GOPRIVATE="gitlab.com/chanasit,github.com/chanasit"
path+=("$GOBIN")

# RUST
export CARGO_HOME="$HOME/.cargo"

# Terraform Config
export TF_LOG=

# Android Home
export ANDROID_HOME="$HOME/Android/Sdk"
path+=(
  "$ANDROID_HOME/emulator"
  "$ANDROID_HOME/tools"
  "$ANDROID_HOME/tools/bin"
  "$ANDROID_HOME/platform-tools"
)

# DOCKER CONFIG
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

# KUBE config
export KUBECONFIG=$HOME/.kube/config

# FZF config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --follow -g "!{.git,node_modules,vendor}/*" 2> /dev/null'

# NNN file manager
BLK="04" CHR="04" DIR="04" EXE="00" REG="00" HARDLINK="00" SYMLINK="06" MISSING="00" ORPHAN="01" FIFO="0F" SOCK="0F" OTHER="02"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export NNN_COLORS='2136'
export NNN_PLUG='p:preview-tui'
export NNN_OPTS='H'
export NNN_FIFO='/tmp/nnn.fifo'

# NVM: load on first use to keep new shell startup fast.
export NVM_DIR="$HOME/.nvm"
_load_nvm() {
  unfunction nvm node npm npx yarn pnpm 2>/dev/null
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  "$@"
}
for _nvm_cmd in nvm node npm npx yarn pnpm; do
  eval "function ${_nvm_cmd}() { _load_nvm ${_nvm_cmd} \"\$@\" }"
done
unset _nvm_cmd

# Replace ~/GoogleSDK with your actual installation path
if [ -f ~/GoogleSDK/path.zsh.inc ]; then . ~/GoogleSDK/path.zsh.inc; fi
if [ -f ~/GoogleSDK/completion.zsh.inc ]; then . ~/GoogleSDK/completion.zsh.inc; fi

# Google Cloud SDK
export CLOUDSDK_PYTHON_SITEPACKAGES=1
if command -v python3 >/dev/null 2>&1; then
  export CLOUDSDK_PYTHON="$(command -v python3)"
fi
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# K9S
export K9S_CONFIG_DIR="$HOME/.config/k9s"

##############################################################
# => Alias ZSH Script
##############################################################
alias rg='rg --no-ignore --hidden --follow -g "!{.git,node_modules,vendor}/*" 2> /dev/null'
# alias pbcopy='xclip -selection clipboard'
# alias pbpaste='xclip -selection clipboard -o'
alias t="tmux new -s hjkl || tmux attach -t hjkl "
alias vim="nvim"
alias vi="nvim"
alias ping='ping -c 5'
alias fastping='ping -c 100 -s.2'
alias watch='watch '
alias clang="clang"
alias mk='minikube'
alias k="kubectl"
alias kt='kubetail'
alias y="yay"
alias tf="terraform"
alias vg="vagrant"
alias tg="terragrunt"
alias tm="terramate"
alias gs='git status'
alias gpu='git push'
alias gpl='git pull'
alias g3='git log --graph --color --pretty=format:"%C(yellow)%H%C(green)%d%C(reset)%n%x20%cd%n%x20%cn%x20(%ce)%n%x20%s%n"'
alias gf='git fetch --all'
alias gd='git diff'
alias gb='git branch'
alias gp='git branch | grep -v -E "main|master|develop" | xargs git branch -D'
alias n='nnn -deH'
alias l="ls -lah"
alias x='codex'

autoload -Uz bashcompinit
bashcompinit
if [ -x "$HOME/Golang/bin/terramate" ]; then
  complete -o nospace -C "$HOME/Golang/bin/terramate" terramate
fi

# functions
function curl() {
  command curl "$@" | less -R
}
