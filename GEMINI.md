# GEMINI.md

## Overview & Permanent Context
Personal dotfiles and DevOps configuration repository for macOS and Linux (Arch + i3), managed via symlinks using `make config`.

- **Primary Shell**: zsh (`.zshrc`, zprezto, custom aliases & functions)
- **Editor**: Neovim (`.config/nvim/init.lua`, CoC)
- **Terminals & Multiplexer**: Ghostty, Kitty, Alacritty, tmux (`.tmux.conf`, `.tmux.conf.local`)
- **Desktop & Window Manager**: i3 (`.config/i3/config`), picom, dunst, redshift, gxkb
- **DevOps & Cloud Stack**: Kubernetes (`k8s`, `k9s`), Docker, Terraform, Terramate (`tm`), Google Cloud (`gcloud`, `cloud-sql-proxy`, `alloydb-auth-proxy`), AWS, HashiCorp Vault
- **AI Tooling & Agents**: Antigravity CLI (`ag` / `agy`), Claude Code (`ce` / `claude`), Codex (`x` / `codex`), RTK (`rtk`)

---

## Core Directives & Communication Style
- **Tone & Style**: Direct, technical, and concise. Cut fluff and avoid conversational filler.
- **Accuracy**: Preserve code, paths, flags, and commands byte-for-byte.
- **Output Efficiency**: Keep responses and command executions token-efficient. Prefer concise summaries or filtered commands (`rtk <cmd>`) when dealing with large logs or infrastructure traces.

---

## Hard DevOps Guardrails & Safety
1. **Destructive Operations Block**:
   - NEVER execute destructive actions (`terraform destroy`, `kubectl delete namespace`, `docker compose down -v`, `git reset --hard`, `git push --force`) without explicit confirmation from the user.
2. **Strict Secrets Policy**:
   - NEVER commit or hardcode credentials, API tokens, passwords, or private keys into tracked files.
   - Reference environment variables or HashiCorp Vault (`VAULT_ADDR="http://127.0.0.1:8200"`, see [VAULT.md](VAULT.md)).
3. **No Manual Drift**:
   - Avoid manual UI steps or untracked ad-hoc configurations. All environment states and configurations must exist as reproducible code.

---

## Dotfiles Management & Conventions
- **Symlink Setup**:
  - Symlinks are declared and linked via `Makefile`. Run `make config` (or `make config-x` for 156dpi X11).
  - All symlinks follow the pattern: `ln -vsfn ${PWD}/<src> ${HOME}/<dest>`.
  - When introducing a new config file or modifying paths, always update `Makefile` and [README.md](README.md).
- **Cross-Platform Awareness**:
  - Configurations support both macOS (`/opt/homebrew`, Darwin paths) and Linux (Arch, X11, pacman/yay). Keep conditional checks intact (e.g. `uname`, `DISPLAY`).
- **Git Conventions**:
  - Repos use `ignorecase = false` and rebase workflows (`pull.rebase = true`).
  - Git identity includes conditional configs (`.gitconfig-me` for personal/open source, `.gitconfig-td` for work). Do not remove or alter `includeIf` directives.

---

## Common Utilities & Commands
| Task | Command | Description |
|---|---|---|
| Apply dotfiles | `make config` | Symlinks all dotfiles to `$HOME` |
| Symlink help | `make help` | Lists Makefile targets |
| Terraform Plan | `terraform plan -parallelism=64` or `tfp` | High-parallelism plan |
| Terramate | `terramate run -- terraform <cmd>` | Multi-module execution |
| Cluster status | `kubectl get pods -A` or `k9s` | Inspect all pods or run K9s TUI |
| Cloud Proxies | `cloud-sql-proxy` (`csql`) / `alloydb-auth-proxy` (`aap`) | Secure DB connections |
| Local Vault | `vault server -dev` | Dev mode server (see [VAULT.md](VAULT.md)) |
| Token filter | `rtk <command>` | Filter and condense CLI output |

---

## Agent Workflow
- Think step-by-step before modifying dotfiles or infrastructure configs.
- Check existing config files (`.zshrc`, `.config/*`, `Makefile`) before recommending additions to prevent duplicate aliases or conflicts.
- Always verify shell syntax and format before committing changes.
