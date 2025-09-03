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

# Custom binary file
export PATH=$PATH:$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin

# AWS path
export AWS_CONFIG_FILE="$HOME/.aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$HOME/.aws/credentials"

# SSH path
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

# yarn path
export PATH="$PATH:$HOME/.yarn/bin"

# java path
export JAVA_17_HOME=$(/usr/libexec/java_home -v 17)
export JAVA_11_HOME=$(/usr/libexec/java_home -v 11)
export JAVA_8_HOME=$(/usr/libexec/java_home -v 1.8)

alias java17='export JAVA_HOME=$JAVA_17_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'
alias java8='export JAVA_HOME=$JAVA_8_HOME'
java17

# GO path
export GOPATH=$HOME/Golang
export GOBIN=$HOME/Golang/bin
export GOCACHE=$HOME/.cache
export GO111MODULE=on
export GOPRIVATE="gitlab.com/chanasit,github.com/chanasit"
export PATH="$PATH:$(go env GOPATH)/bin"

# RUST
export CARGO_HOME="$HOME/.cargo"
export PATH="$HOME/.cargo/bin:$PATH"

# Terraform Config
export TF_LOG=
export TF_VERSION=0.12.31

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
export FZF_DEFAULT_COMMAND='rg --files --follow -g "!{.git,node_modules,vendor}/*" 2> /dev/null'

# NNN file manager
BLK="04" CHR="04" DIR="04" EXE="00" REG="00" HARDLINK="00" SYMLINK="06" MISSING="00" ORPHAN="01" FIFO="0F" SOCK="0F" OTHER="02"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export NNN_COLORS='2136'
export NNN_PLUG='p:preview-tui'
export NNN_OPTS='H'
export NNN_FIFO='/tmp/nnn.fifo'

# PyENV
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/Binary/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/Binary/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/Binary/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/Binary/google-cloud-sdk/completion.zsh.inc'; fi

export PATH=$PATH:$HOME/Binary/google-cloud-sdk/bin
export PATH=$PATH:$HOME/Binary/

# Google Cloud SDK
export CLOUDSDK_PYTHON_SITEPACKAGES=1
export CLOUDSDK_PYTHON=/usr/bin/python3
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

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
alias x='startx'

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C $HOME/Golang/bin/terramate terramate


# functions
function curl() {
  command curl "$@" | less -R
}
