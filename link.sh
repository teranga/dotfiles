#!/usr/bin/env bash
# Symlink the dotfiles into place. Safe to re-run; existing real files are moved to *.pre-dotfiles.
set -euo pipefail
D="$HOME/.dotfiles"

link() { # link <source in repo> <target>
  local src="$D/$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then mv "$dst" "$dst.pre-dotfiles"; fi
  ln -sfn "$src" "$dst"
  echo "  $dst -> $src"
}

link .zshrc          "$HOME/.zshrc"
link zshenv          "$HOME/.zshenv"
link zprofile        "$HOME/.zprofile"
link bash_profile    "$HOME/.bash_profile"
link gitconfig       "$HOME/.gitconfig"

link config/ghostty  "$HOME/.config/ghostty"
link config/starship.toml "$HOME/.config/starship.toml"
link config/atuin    "$HOME/.config/atuin"
link config/mise     "$HOME/.config/mise"
link config/zellij   "$HOME/.config/zellij"
link config/eza      "$HOME/.config/eza"
link config/yazi     "$HOME/.config/yazi"
link config/btop/themes/catppuccin_mocha.theme "$HOME/.config/btop/themes/catppuccin_mocha.theme"
link config/lazygit/config.yml "$HOME/Library/Application Support/lazygit/config.yml"
link "config/bat/themes/Catppuccin Mocha.tmTheme" "$(bat --config-dir)/themes/Catppuccin Mocha.tmTheme"
bat cache --build >/dev/null
