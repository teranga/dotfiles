# ~/.zprofile — login zsh. Static equivalent of `brew shellenv` (saves ~15 ms per tab);
# the prefix is fixed on Apple Silicon.
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
path=(/opt/homebrew/bin /opt/homebrew/sbin $path)
typeset -U path
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"
