##############################################################
# => ZSH Startup with Tmux
##############################################################
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach -t hack || tmux new -s hack
fi

##############################################################
# => ZSH Startup with P10K
##############################################################
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##############################################################
# => ZSH Plugins
##############################################################
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
ZSH="$HOME/.oh-my-zsh"
UPDATE_ZSH_DAYS=13
ZSH_CUSTOM=$ZSH/custom
ZSH_THEME="powerlevel10k/powerlevel10k"
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"
DISABLE_AUTO_TITLE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
NVM_LAZY_LOAD=true
NVM_COMPLETION=true

# ZSH Plugins
plugins=(
    osx
    kubectl
    docker
)

source $ZSH/oh-my-zsh.sh

##############################################################
# => Keys Binding
##############################################################
# bindkey -v
# bindkey -v '^?' backward-delete-char
# bindkey "^[[1;3C" forward-word
# bindkey "^[[1;3D" backward-word
##############################################################
# => Export Global Environments Variable
##############################################################
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  export VISUAL='nvim'
  export EDITOR='nvim'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export VISUAL='nvim'
  export EDITOR='nvim'
fi
export ARCHFLAGS="-arch x86_64"
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

# AWS path
export AWS_CONFIG_FILE="$HOME/.aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$HOME/.aws/credentials"

# SSH path
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

#PYTHON path
export PATH="/usr/local/opt/python@3.9/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/python@3.9/lib"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then export PKG_CONFIG_PATH="/usr/local/opt/python@3.9/lib/pkgconfig"
elif [[ "$OSTYPE" == "darwin"* ]]; then export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig
fi

# GO path
# export GOPATH=$HOME/go
# export GOBIN=$HOME/go/bin
# export GOCACHE=$HOME/.cache
# export GO111MODULE=on
# export GOPRIVATE="gitlab.com/botnoi-sme,bitbucket.org/botnoi-sme,github.com/botnoi-sme"
# export PATH=$PATH:$GOPATH/bin
# export PATH=$PATH:$GOROOT/bin
# if [[ "$OSTYPE" == "darwin"* ]]; then export GOROOT=/usr/local/Cellar/go/1.16.3/libexec
# fi

# Clang LLVM
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export CC=/usr/bin/gcc
export CXX=/usr/bin/g++

#HASHKELL
export PATH="$HOME/.cabal/bin:$PATH"


# NVM path
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Custom binary file (ubuntu)
export PATH=$PATH:$HOME/bin

# YARN
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Swift
# export PATH="/Library/Developer/CommandLineTools/usr/bin:$PATH"

# RUST
export PATH="$HOME/.cargo/bin:$PATH"

# GNU bin
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# Terraform Config
export TF_LOG=
# Terraform Completion
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform


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
export KUBECONFIG=$HOME/.kube/bn-sme-production-cluster:$HOME/.kube/bn-sme-staging-cluster:$HOME/.kube/config

# FZF config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules,vendor}/*" 2> /dev/null'
# export FZF_DEFAULT_OPTS="--color=bg+:#222222,bg:#222222,border:#3A3A3A,spinner:#719899,hl:#719872,fg:#616161,header:#719872,info:#727100,pointer:#E12672,marker:#E17899,fg+:#616161,prompt:#0099BD,hl+:#719899"
export FZF_COMPLETION_TRIGGER='~~'

# P10K config
[[ ! -f ~/dotfiles/.p10k.zsh ]] || source ~/dotfiles/.p10k.zsh
export POWERLEVEL9K_DIR_MAX_LENGTH=1
export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
export POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_last"
export ZVM_CURSOR_STYLE_ENABLED=false

# Bash Completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi

# NNN file manager
export NNN_COLORS='1234'
export NNN_PLUG='t:preview-tui;i:img-preview;v:treeview'
export NNN_OPTS='H'
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'

##############################################################
# => Alias Bash Script
##############################################################
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  alias vi="nvim"
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
  alias open="nautilus"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  alias vi="nvim"
fi
alias ping='ping -c 5'
alias fastping='ping -c 100 -s.2'
alias watch='watch '
alias emacs="emacs -nw"
alias grep="rg"
alias clang="clang-11"
alias python="python3"
alias pip="pip3"
alias pypy="pypy3"
alias pip_pypy="pip_pypy3"
alias k="kubectl"
alias tf="terraform"
alias os="openstack"
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport"
alias icloud="~/Library/Mobile\ Documents/com~apple~CloudDocs/"
alias bt="blueutil"
alias nnn="nnn -dea"
alias lg="lazygit"
alias gs='git status'
alias g3='git t'
alias gd='git df'
alias gf='git fetch --all'
