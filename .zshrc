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

# Custom binary file (ubuntu)
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin

# GO path
export GOPATH=$HOME/Golang
export GOBIN=$HOME/Golang/bin
export GOCACHE=$HOME/.cache
export GO111MODULE=on
export GOPRIVATE=""
export PATH=$PATH:$GOPATH/bin

# RUST
export CARGO_HOME="$HOME/.cargo"
export PATH="$HOME/.cargo/bin:$PATH"

# JAVA
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export JAVA_17_HOME=$(/usr/libexec/java_home -v 17)
  export JAVA_8_HOME=$(/usr/libexec/java_home -v 1.8)

  alias java17='export JAVA_HOME=$JAVA_17_HOME'
  alias java8='export JAVA_HOME=$JAVA_8_HOME'
  java8
fi

# Android Home
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# DOCKER CONFIG
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

# KUBE config
export KUBECONFIG=$HOME/.kube/config

# FZF config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --follow -g "!{.git,**/node_modules,**/vendor,venv,**/__pycache__,**/venv}" 2> /dev/null'

# NNN file manager
# BLK="04" CHR="04" DIR="04" EXE="00" REG="00" HARDLINK="00" SYMLINK="06" MISSING="00" ORPHAN="01" FIFO="0F" SOCK="0F" OTHER="02"
# export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export NNN_COLORS='2136'
export NNN_PLUG='p:preview-tui'
export NNN_OPTS='H'
export NNN_FIFO='/tmp/nnn.fifo'

# Google Cloud SDK
export CLOUDSDK_PYTHON=/usr/bin/python3
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Ngrok CLI
if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

# Network Proxy
export HTTP_PROXY=
export HTTPS_PROXY=
export NO_PROXY=localhost,127.0.0.1,10.96.0.0/12,192.168.99.0/24,192.168.39.0/24

# Terraform Config
export TF_VERSION=0.12.31
export TF_LOG=1

# Pyenv Config
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

##############################################################
# => Alias ZSH Script
##############################################################
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  alias pbcopy='pbcopy'
  alias pbpaste='pbpaste'
fi
alias rg='rg --no-ignore --hidden --follow -g "!{.git,node_modules,vendor}/*" 2> /dev/null'
alias t="tmux new -s hjkl || tmux attach -t hjkl "
alias ping='ping -c 5'
alias watch='watch '
alias clang="clang"
alias pip="pip3"
alias mk='minikube'
alias k="kubectl"
alias kt='kubetail'
alias y="yay"
alias tf="terraform"
alias gs='git status'
alias g3='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --all'
alias gf='git fetch --all'
alias gd='git diff'
alias gb='git branch'
alias n='nnn -deH'
alias vi='nvim'
alias l="ls -lah"
alias x='startx'
