export OSTYPE = $(shell uname)

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
	ln -vsfn ${PWD}/.config/i3 ${HOME}/.config/i3
	ln -vsfn ${PWD}/.config/ranger ${HOME}/.config/ranger
	ln -vsfn ${PWD}/.config/nvim ${HOME}/.config/nvim
	ln -vsfn ${PWD}/.config/spotify-tui ${HOME}/.config/spotify-tui
	ln -vsfn ${PWD}/.editorconfig ${HOME}/.editorconfig
	ln -vsfn ${PWD}/.vimrc ${HOME}/.vimrc
	ln -vsfn ${PWD}/.zshrc ${HOME}/.zshrc
	ln -vsfn ${PWD}/.tmux.conf.local ${HOME}/.tmux.conf.local
	ln -vsfn ${PWD}/.curlrc ${HOME}/.curlrc
	vim '+PlugInstall'

fedora: ## install all Fedora packages
	cp -r ${PWD}/.fonts/. ${HOME}/.local/share/fonts/
	dnf install $(shell cat dnf.txt)
	make -i config

macos: ## install all MacOS packages
	cp -r ${PWD}/.fonts/. ${HOME}/Library/Fonts/NerdFonts/
	brew install --formula $(shell cat brew_formula.txt)
	brew install --cask $(shell cat brew_cask.txt)
	make -i config

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.DEFAULT_GOAL := help
