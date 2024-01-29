# Dotfiles

#### Clone
```
git clone git@github.com:chanasit/dotfiles $HOME/.dotfiles
```

[vim](https://www.vim.org/) user

```shell
#configuration
cd $HOME/.dotfiles
ln -vsf ${PWD}/.vimrc ${HOME}/.vimrc
ln -vsf ${PWD}/.editorconfig ${HOME}/.editorconfig
```

[neovim](https://github.com/neovim/neovim) user

```shell
#configuration
cd $HOME/.dotfiles
ln -vsf ${PWD}/.vimrc ${HOME}/.vimrc
ln -vsf ${PWD}/.config/nvim/init.vim ${HOME}/.config/nvim/init.vim
ln -vsf ${PWD}/.config/nvim/coc-settings.json ${HOME}/.config/nvim/coc-settings.json
ln -vsf ${PWD}/.editorconfig ${HOME}/.editorconfig
```

## Alacritty

[Alacritty](https://github.com/alacritty/alacritty) is terminal emulator that has pretty easy configuration

```shell
#configuration
cd $HOME/.dotfiles
ln -vsf ${PWD}/.config/alacritty/alacritty.yml ${HOME}/.config/alacritty/alacritty.yml
```

## Tmux

Follow this link for [tmux](https://github.com/tmux/tmux) and [oh-my-tmux](https://github.com/gpakosz/.tmux) pre-installation guide

```shell
#configuration
cd $HOME/.dotfiles
ln -vsf ${PWD}/.tmux.conf.local ${HOME}/.tmux.conf.local
```

## NNN

[NNN](https://github.com/jarun/nnn)  (n³) is a full-featured terminal file manager. It's tiny, nearly 0-config

[https://github.com/jarun/nnn/wiki](https://github.com/jarun/nnn/wiki)

