# Shell
alias reloadshell="exec zsh"
alias c="clear"
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias dotfiles="cd $HOME/.dotfiles"
alias python="python3"
alias gam="$HOME/bin/gam7/gam"

# Modern replacements (interactive only — scripts still get the real tools)
alias ls="eza --group-directories-first --icons=auto"
alias ll="eza -la --group-directories-first --git --icons=auto"
alias lt="eza --tree --level=2 --group-directories-first --icons=auto"
alias cat="bat --paging=never --style=plain"
alias top="btop"
alias lg="lazygit"

# yazi: open, and cd to wherever you quit it
y() {
  local tmp="$(mktemp -t yazi-cwd.XXXXXX)" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# Git
alias gst="git status"
alias gb="git branch"
alias gc="git checkout"
alias gd="git diff"
alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
alias commit="git add . && git commit -m"
alias wip="commit wip"
alias force="git push --force-with-lease"
alias nuke="git clean -df && git reset --hard"
alias pop="git stash pop"
alias pull="git pull"
alias push="git push"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"

# Claude Code: the GitHub MCP plugin authenticates with $GITHUB_PERSONAL_ACCESS_TOKEN. Hand it the
# gh login token only for this process (no PAT to rotate, nothing exported to the shell).
# A Keychain `github-pat` (shell/secrets.sh) still wins when set.
claude() {
  GITHUB_PERSONAL_ACCESS_TOKEN="${GITHUB_PERSONAL_ACCESS_TOKEN:-$(gh auth token 2>/dev/null)}" command claude "$@"
}
