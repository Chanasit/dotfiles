# Dotfiles

#### Clone
```
git clone git@github.com:chanasit/dotfiles $HOME/.dotfiles
```

#### Configuation for [symlink]() to necessary dotfiles

[vim](https://www.vim.org/) user

```shell
cd $HOME/.dotfiles
ln -vsf ${PWD}/.vimrc ${HOME}/.vimrc
ln -vsf ${PWD}/.editorconfig ${HOME}/.editorconfig
```

[neovim](https://github.com/neovim/neovim) user

```shell
cd $HOME/.dotfiles
ln -vsf ${PWD}/.vimrc ${HOME}/.vimrc
ln -vsf ${PWD}/.config/nvim/init.vim ${HOME}/.config/nvim/init.vim
ln -vsf ${PWD}/.config/nvim/coc-settings.json ${HOME}/.config/nvim/coc-settings.json
ln -vsf ${PWD}/.editorconfig ${HOME}/.editorconfig
```

## Alacritty

[Alacritty](https://github.com/alacritty/alacritty) is terminal emulator that has pretty easy configuration

#### Configuation for symlink necessary dotfiles

```shell
cd $HOME/.dotfiles
ln -vsf ${PWD}/.config/alacritty/alacritty.yml ${HOME}/.config/alacritty/alacritty.yml
```

#### Tip

select theme better with [alacritty-themes](https://www.npmjs.com/package/alacritty-themes)

## Tmux

Follow this link for [tmux](https://github.com/tmux/tmux) and [oh-my-tmux](https://github.com/gpakosz/.tmux) pre-installation guide

#### Configuation for symlink necessary dotfiles

```shell
cd $HOME/.dotfiles
ln -vsf ${PWD}/.tmux.conf.local ${HOME}/.tmux.conf.local
```
