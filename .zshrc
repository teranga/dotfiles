# ~/.zshrc — interactive zsh. Environment lives in shell/env.sh (via ~/.zshenv).
for f in options completion plugins tools aliases; do
  source "$HOME/.dotfiles/zsh/$f.zsh"
done
source "$HOME/.dotfiles/shell/secrets.sh"
if [[ -f "$HOME/.zshrc.local" ]]; then source "$HOME/.zshrc.local"; fi   # machine-only tweaks, not in git
