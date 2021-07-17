# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
##############################################################
# => Start Xorg Server
##############################################################
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx
fi

##############################################################
# => Source Zprezto Config
##############################################################
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

##############################################################
# => Export Global Environments Variable
##############################################################
export VISUAL='nvim'
export EDITOR='nvim'
export ARCHFLAGS="-arch x86_64"
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

# AWS path
export AWS_CONFIG_FILE="$HOME/.aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$HOME/.aws/credentials"

# SSH path
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

# yarn path
export PATH="$PATH:$HOME/.yarn/bin"

# GO path
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export GOCACHE=$HOME/.cache
export GO111MODULE=on
export GOPRIVATE="gitlab.com/botnoi-sme,bitbucket.org/botnoi-sme,github.com/botnoi-sme"
export PATH=$PATH:$GOPATH/bin

# Custom binary file (ubuntu)
export PATH=$PATH:$HOME/.local/bin

# RUST
export CARGO_HOME="$HOME/.cargo"
export PATH="$HOME/.cargo/bin:$PATH"

# Terraform Config
export TF_LOG=

# Android Home
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# DOCKER CONFIG
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

# NVM Home
export PATH=~/.nvm/versions/node/v16.5.0/bin:$PATH
export NVM_DIR=~/.nvm
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh" --no-use
# source /usr/share/nvm/init-nvm.sh

# KUBE config
export KUBECONFIG=$HOME/.kube/config

# FZF config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --follow -g "!{.git,node_modules,vendor}/*" 2> /dev/null'

# NNN file manager
BLK="04" CHR="04" DIR="04" EXE="00" REG="00" HARDLINK="00" SYMLINK="06" MISSING="00" ORPHAN="01" FIFO="0F" SOCK="0F" OTHER="02"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export NNN_COLORS='#0a1b2c3d'
export NNN_PLUG='t:preview-tui;i:img-preview;v:treeview'
export NNN_OPTS='H'
export NNN_FIFO='/tmp/nnn.fifo'

##############################################################
# => Alias Bash Script
##############################################################
alias rg='rg --no-ignore --hidden --follow -g "!{.git,node_modules,vendor}/*" 2> /dev/null'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias tmux="tmux new -s $USERNAME || tmux attach -t $USERNAME "
alias vim="nvim"
alias vi="nvim"
alias ping='ping -c 5'
alias fastping='ping -c 100 -s.2'
alias watch='watch '
alias clang="clang-11"
alias python="python3"
alias pip="pip3"
alias k="kubectl"
alias y="yay"
alias tf="terraform"
alias gs='git status'
alias g3='git log --graph --decorate --oneline'
alias gf='git fetch --all'
alias gd='git diff'
alias n='nnn -deH'
alias code="code-insiders"
