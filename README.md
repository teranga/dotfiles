# Dotfiles

## The 2026 stack

Ghostty · zsh (no framework) · Starship · fzf + fzf-tab · zoxide · Atuin · eza · fd · ripgrep · bat ·
delta · lazygit · yazi · btop · tldr · glow · zellij · mise (Java/Node/Python) · direnv —
all in Catppuccin Mocha with JetBrains Mono Nerd Font.

| Where | What |
|---|---|
| `shell/env.sh` | env for every shell (zsh and bash); mise shims on PATH |
| `shell/secrets.sh` | tokens read from the macOS Keychain — never stored in this repo |
| `zsh/*.zsh` | options, completion, plugins, cached tool hooks, aliases (sourced by `.zshrc`) |
| `config/*` | Ghostty, Starship, Atuin, mise, lazygit, yazi, eza, zellij, btop, bat, delta |
| `link.sh` | symlinks everything into `~` and `~/.config` (safe to re-run) |

### Fresh machine

```sh
git clone --recurse-submodules git@github.com:teranga/dotfiles.git ~/.dotfiles
brew bundle --file ~/.dotfiles/Brewfile
~/.dotfiles/link.sh
mise install
security add-generic-password -U -a "$USER" -s github-pat -w    # prompts; repeat for grafana-mcp
```

Machine-only settings go in `~/.zshrc.local` and `~/.gitconfig.local` (git identity), both untracked.
Startup target: `hyperfine 'zsh -l -i -c exit'` under 100 ms.

---

Originally forked from [driesvints/dotfiles](https://github.com/driesvints/dotfiles); `fresh.sh` bootstraps a new Mac,
`.macos` holds macOS defaults, and `clone.sh` clones working repositories.
