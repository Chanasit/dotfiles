# Dotfiles

![screenshot](./assets/screen_shot.png)

## Vim Plugs

Follow is [link](https://github.com/junegunn/vim-plug) for pre-installation [vim-plug](https://github.com/junegunn/vim-plug) module

#### Plug Dependencies

- [coc.nvim](https://github.com/neoclide/coc.nvim)
- [undotree](https://github.com/mbbill/undotree)
- [indentLine](https://github.com/Yggdroot/indentLine)
- [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)
- [vim-easymotion](https://github.com/easymotion/vim-easymotion)
- [vim-floaterm](https://github.com/voldikss/vim-floaterm)
- [vim-commentary](https://github.com/tpope/vim-commentary)
- [vim-airline](https://github.com/vim-airline/vim-airline)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
- [vim-visual-multi](https://github.com/mg979/vim-visual-multi)
- [vim-instant-markdown](https://github.com/instant-markdown/vim-instant-markdown)
- [vim-colors-github](https://github.com/cormacrelf/vim-colors-github)

#### Binary Dependencies

- [nnn](https://github.com/jarun/nnn)
- [rg](https://github.com/BurntSushi/ripgrep)
- [fzf](https://github.com/junegunn/fzf)
- [k9s](https://github.com/derailed/k9s)
- [lazygit](https://github.com/jesseduffield/lazygit)

#### Configuation for [symlink](https://linuxize.com/post/how-to-create-symbolic-links-in-linux-using-the-ln-command) to necessary dotfiles

[vim](https://www.vim.org/) user

```shell
$ ln -vsf ${PWD}/.vimrc ${HOME}/.vimrc
$ ln -vsf ${PWD}/.editorconfig ${HOME}/.editorconfig
```

[neovim](https://github.com/neovim/neovim) user

```shell
$ ln -vsf ${PWD}/.vimrc ${HOME}/.vimrc
$ ln -vsf ${PWD}/.config/nvim/init.vim ${HOME}/.config/nvim/init.vim
$ ln -vsf ${PWD}/.config/nvim/coc-settings.json ${HOME}/.config/nvim/coc-settings.json
$ ln -vsf ${PWD}/.editorconfig ${HOME}/.editorconfig
```

#### Performance Testing
``` shell
$ python <(curl -sSL https://raw.githubusercontent.com/hyiltiz/vim-plugins-profile/master/vim-plugins-profile.py)
```

## Alacritty

[Alacritty](https://github.com/alacritty/alacritty) is terminal emulator that has pretty easy configuration

#### Configuation for symlink necessary dotfiles

```shell
$ ln -vsf ${PWD}/.config/alacritty/alacritty.yml ${HOME}/.config/alacritty/alacritty.yml
```

#### Tip

select theme better with [alacritty-themes](https://www.npmjs.com/package/alacritty-themes)

## Tmux

Follow this link for [tmux](https://github.com/tmux/tmux) and [oh-my-tmux](https://github.com/gpakosz/.tmux) pre-installation guide

#### Configuation for symlink necessary dotfiles

```shell
$ ln -vsf ${PWD}/.tmux.conf.local ${HOME}/.tmux.conf.local
```
