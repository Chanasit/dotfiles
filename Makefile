export OSTYPE = $(shell uname)

fonts: ## install font package
	echo "fonts install \n"
	cp -r ${PWD}/.fonts/. ${HOME}/Library/Fonts/NerdFonts/

brew: ## install brew package (osx)
	brew install --formula $(shell cat brew_formula.txt)
	brew install --cask $(shell cat brew_cask.txt)

snap: ## TODO: install snap package (ubuntu)
	echo "......"

config: ## install configuration
	echo "install vim plug \n"
	curl -fLo ${HOME}/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	echo "install powerlevel10k \n"
	rm -rf ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k
	git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k
	echo "install oh-my-tmux \n"
	rm -rf ${HOME}/.tmux
	git clone https://github.com/gpakosz/.tmux.git ${HOME}/.tmux
	echo "symlink dotfile config \n"
	ln -vsfn ${PWD}/.config/alacritty ${HOME}/.config/alacritty
	ln -vsfn ${PWD}/.config/htop ${HOME}/.config/htop
	ln -vsfn ${PWD}/.config/ranger ${HOME}/.config/ranger
	ln -vsfn ${PWD}/.config/nvim ${HOME}/.config/nvim
	ln -vsfn ${PWD}/.config/spotify-tui ${HOME}/.config/spotify-tui
	ln -vsfn ${PWD}/.editorconfig ${HOME}/.editorconfig
	ln -vsfn ${PWD}/.vimrc ${HOME}/.vimrc
	ln -vsfn ${PWD}/.zshrc ${HOME}/.zshrc
	ln -vsfn ${PWD}/.tmux.conf.local ${HOME}/.tmux.conf.local
	ln -vsfn ${PWD}/.p10k.zsh ${HOME}/.p10k.zsh
	ln -vsfn ${PWD}/.curlrc ${HOME}/.curlrc
	vim '+PlugInstall'

install: ## install all packages base on OSTYPE
ifeq (${OSTYPE}, Linux)
	echo ".........."
endif
ifeq (${OSTYPE}, Darwin)
	make -i fonts brew config
endif

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
