#!/bin/sh
# Set up a new Mac from these dotfiles. Safe to re-run.
set -e
echo "Setting up your Mac..."

if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

cd "$(dirname "$0")"
git submodule update --init --recursive
brew update
brew bundle --file ./Brewfile
./link.sh
mise install

echo "Done. Add secrets to the Keychain (see README), then open Ghostty."
# Optional: ./clone.sh (repositories), source ./.macos (macOS defaults; reloads the shell)
