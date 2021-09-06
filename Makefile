export OSTYPE = $(shell uname)

config: ## install configuration
	echo "symlink dotfile config \n"
	ln -vsfn ${PWD}/.config/bat/config ${HOME}/.config/bat/config
	ln -vsfn ${PWD}/.config/kitty/kitty.conf ${HOME}/.config/kitty/kitty.conf
	ln -vsfn ${PWD}/.config/kitty/current-theme.conf ${HOME}/.config/kitty/current-theme.conf
	ln -vsfn ${PWD}/.config/htop/htoprc ${HOME}/.config/htop/htoprc
	ln -vsfn ${PWD}/.config/i3/config ${HOME}/.config/i3/config
	ln -vsfn ${PWD}/.config/i3/i3status.conf ${HOME}/.config/i3/i3status.conf
	ln -vsfn ${PWD}/.config/nvim/init.vim ${HOME}/.config/nvim/init.vim
	ln -vsfn ${PWD}/.config/nvim/coc-settings.json ${HOME}/.config/nvim/coc-settings.json
	ln -vsfn ${PWD}/.editorconfig ${HOME}/.editorconfig
	ln -vsfn ${PWD}/.vimrc ${HOME}/.vimrc
	ln -vsfn ${PWD}/.gitconfig ${HOME}/.gitconfig
	ln -vsfn ${PWD}/.vim/colors ${HOME}/.vim/colors
	ln -vsfn ${PWD}/.zshrc ${HOME}/.zshrc
	ln -vsfn ${PWD}/.tmux.conf ${HOME}/.tmux.conf
	ln -vsfn ${PWD}/.tmux.conf.local ${HOME}/.tmux.conf.local
	ln -vsfn ${PWD}/.config/picom/picom.conf ${HOME}/.config/picom/picom.conf
	ln -vsfn ${PWD}/.config/dunst/dunstrc ${HOME}/.config/dunst/dunstrc
	ln -vsfn ${PWD}/.curlrc ${HOME}/.curlrc
	ln -vsfn ${PWD}/.xinitrc ${HOME}/.xinitrc
	ln -vsfn ${PWD}/.config/gxkb/gxkb.cfg ${HOME}/.config/gxkb/gxkb.cfg
	ln -vsfn ${PWD}/.config/gtk-3.0/settings.ini ${HOME}/.config/gtk-3.0/settings.ini

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.DEFAULT_GOAL := help
