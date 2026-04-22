# Dotfiles

Personal configuration files for my Linux desktop environment, managed via symlinks.

---

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Tools](#tools)
  - [Neovim](#neovim)
  - [i3](#i3)
  - [Alacritty](#alacritty)
  - [Ghostty](#ghostty)
  - [Kitty](#kitty)
  - [Dunst](#dunst)
  - [Picom](#picom)
  - [Redshift](#redshift)
  - [Ranger](#ranger)
  - [htop](#htop)
  - [k9s](#k9s)
  - [GTK 3.0](#gtk-30)
  - [gxkb](#gxkb)
  - [yay](#yay)
- [Directory Structure](#directory-structure)

---

## Requirements

- Git
- Arch Linux (or any Arch-based distro)
- Each tool installed separately — see per-tool notes below

Install all tools at once with `yay`:

```bash
yay -S neovim i3 alacritty ghostty kitty dunst picom redshift ranger htop k9s gxkb
```

---

## Installation

Clone the repository:

```bash
git clone https://github.com/Chanasit/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Then follow the symlink instructions for each tool below.

> **Tip:** All symlink commands use `ln -vsf` which will overwrite existing files and print a confirmation for each link created.

---

## Tools

### Neovim

Feature-rich text editor. Config includes `init.vim` and CoC (Conquer of Completion) settings.

**Symlink:**

```bash
mkdir -p ~/.config/nvim

ln -vsf ${PWD}/.vimrc ${HOME}/.vimrc
ln -vsf ${PWD}/.config/nvim/init.vim ${HOME}/.config/nvim/init.vim
ln -vsf ${PWD}/.config/nvim/coc-settings.json ${HOME}/.config/nvim/coc-settings.json
ln -vsf ${PWD}/.editorconfig ${HOME}/.editorconfig
```

---

### i3

Tiling window manager. Config handles keybindings, layouts, startup applications, and bar configuration.

**Symlink:**

```bash
mkdir -p ~/.config/i3

ln -vsf ${PWD}/.config/i3/config ${HOME}/.config/i3/config
```

> **Tip:** Reload i3 config in-place with `$mod+Shift+r` without restarting the session.

---

### Alacritty

GPU-accelerated terminal emulator with minimal, YAML-based configuration.

**Symlink:**

```bash
mkdir -p ~/.config/alacritty

ln -vsf ${PWD}/.config/alacritty/alacritty.yml ${HOME}/.config/alacritty/alacritty.yml
```

---

### Ghostty

Fast, native terminal emulator with a focus on performance and simplicity.

**Symlink:**

```bash
mkdir -p ~/.config/ghostty

ln -vsf ${PWD}/.config/ghostty/config ${HOME}/.config/ghostty/config
```

---

### Kitty

Feature-rich, GPU-based terminal emulator with support for ligatures, tabs, and splits.

**Symlink:**

```bash
mkdir -p ~/.config/kitty

ln -vsf ${PWD}/.config/kitty/kitty.conf ${HOME}/.config/kitty/kitty.conf
```

---

### Dunst

Lightweight, customizable notification daemon. Replaces the default desktop notification popup.

**Symlink:**

```bash
mkdir -p ~/.config/dunst

ln -vsf ${PWD}/.config/dunst/dunstrc ${HOME}/.config/dunst/dunstrc
```

> **Tip:** Restart Dunst after symlinking to apply changes:
> ```bash
> pkill dunst && dunst &
> ```

---

### Picom

Compositor for X11. Handles window transparency, shadows, and fade animations.

**Symlink:**

```bash
mkdir -p ~/.config/picom

ln -vsf ${PWD}/.config/picom/picom.conf ${HOME}/.config/picom/picom.conf
```

> **Tip:** Restart Picom after changes:
> ```bash
> pkill picom && picom --daemon
> ```

---

### Redshift

Adjusts screen color temperature based on time of day to reduce eye strain.

**Symlink:**

```bash
mkdir -p ~/.config/redshift

ln -vsf ${PWD}/.config/redshift/redshift.conf ${HOME}/.config/redshift/redshift.conf
```

> **Tip:** Make sure your latitude/longitude is set correctly in `redshift.conf` for accurate sunrise/sunset timing.

---

### Ranger

Terminal-based file manager with Vim-style keybindings.

**Symlink:**

```bash
mkdir -p ~/.config/ranger

ln -vsf ${PWD}/.config/ranger/rc.conf ${HOME}/.config/ranger/rc.conf
ln -vsf ${PWD}/.config/ranger/rifle.conf ${HOME}/.config/ranger/rifle.conf
```

---

### htop

Interactive process viewer. Config stores column layout and display preferences.

**Symlink:**

```bash
mkdir -p ~/.config/htop

ln -vsf ${PWD}/.config/htop/htoprc ${HOME}/.config/htop/htoprc
```

---

### k9s

Terminal UI for managing Kubernetes clusters.

**Symlink:**

```bash
mkdir -p ~/.config/k9s

ln -vsf ${PWD}/.config/k9s/config.yml ${HOME}/.config/k9s/config.yml
```

---

### GTK 3.0

GTK theme and font settings applied to GTK3 applications.

**Symlink:**

```bash
mkdir -p ~/.config/gtk-3.0

ln -vsf ${PWD}/.config/gtk-3.0/settings.ini ${HOME}/.config/gtk-3.0/settings.ini
```

---

### gxkb

System tray keyboard layout indicator and switcher for X11.

**Symlink:**

```bash
mkdir -p ~/.config/gxkb

ln -vsf ${PWD}/.config/gxkb/gxkb.cfg ${HOME}/.config/gxkb/gxkb.cfg
```

---

### yay

AUR helper for Arch Linux. Config stores preferences for package build and update behavior.

**Symlink:**

```bash
mkdir -p ~/.config/yay

ln -vsf ${PWD}/.config/yay/config.json ${HOME}/.config/yay/config.json
```

---

## Directory Structure

```
dotfiles/
├── .vimrc
├── .editorconfig
├── .tmux.conf
└── .config/
    ├── alacritty/
    │   └── alacritty.yml
    ├── dunst/
    │   └── dunstrc
    ├── ghostty/
    │   └── config
    ├── gtk-3.0/
    │   └── settings.ini
    ├── gxkb/
    │   └── gxkb.cfg
    ├── htop/
    │   └── htoprc
    ├── i3/
    │   └── config
    ├── k9s/
    │   └── config.yml
    ├── kitty/
    │   └── kitty.conf
    ├── nvim/
    │   ├── init.vim
    │   └── coc-settings.json
    ├── picom/
    │   └── picom.conf
    ├── ranger/
    │   ├── rc.conf
    │   └── rifle.conf
    ├── redshift/
    │   └── redshift.conf
    └── yay/
        └── config.json
```

---

## License

MIT
