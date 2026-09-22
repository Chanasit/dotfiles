# Dotfiles

Personal config files for Linux desktop (Arch + i3), managed via symlinks.

## Requirements

- Git, `make`
- Arch-based distro

Install tools:

```bash
yay -S neovim i3 alacritty ghostty kitty dunst picom redshift ranger htop k9s gxkb
```

## Installation

```bash
git clone https://github.com/Chanasit/dotfiles.git ~/dotfiles
cd ~/dotfiles
make config     # symlink all configs
make config-x   # X server 156dpi (optional)
make help       # list targets
```

Symlinks use `ln -vsfn` — overwrites existing, prints each link.

## Tools

| Tool | Purpose |
|------|---------|
| Neovim | Editor — `init.lua` + CoC |
| i3 | Tiling WM (reload: `$mod+Shift+r`) |
| Alacritty / Ghostty / Kitty | Terminal emulators |
| Dunst | Notification daemon |
| Picom | X11 compositor |
| Redshift | Screen color temp |
| Ranger | TUI file manager |
| htop | Process viewer |
| k9s | Kubernetes TUI |
| GTK 3.0 / gxkb | Theme / keyboard layout |
| tmux | Terminal multiplexer |

## Vault

Local [HashiCorp Vault](https://developer.hashicorp.com/vault) dev server for secrets. `VAULT_ADDR` set in `.zshrc`. Full guide: [VAULT.md](VAULT.md).

## Directory Structure

```
dotfiles/
├── .zshrc .gitconfig .gitconfig-me .gitconfig-td .tmux.conf .editorconfig .inputrc
├── Makefile
└── .config/
    ├── alacritty/ ghostty/ kitty/   # terminals
    ├── i3/ picom/ dunst/ gxkb/      # desktop
    ├── nvim/ ranger/ htop/ k9s/     # tools
    └── gtk-3.0/
```

## License

MIT
