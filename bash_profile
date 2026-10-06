# ~/.bash_profile — bash is not the daily shell, but scripts and some tools start it.
eval "$(/opt/homebrew/bin/brew shellenv)"
. "$HOME/.dotfiles/shell/env.sh"
. "$HOME/.dotfiles/shell/secrets.sh"
export HISTSIZE=10000
alias python="python3"
alias gam="$HOME/bin/gam7/gam"
