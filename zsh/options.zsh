# History: big, shared across tabs, de-duplicated. Atuin indexes it too.
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt EXTENDED_HISTORY SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS HIST_VERIFY

setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS PUSHD_SILENT
setopt EXTENDED_GLOB INTERACTIVE_COMMENTS NO_BEEP

bindkey -e                                  # emacs keys (Ctrl-A/E/W…)
bindkey '^[[1;3D' backward-word             # Option-Left
bindkey '^[[1;3C' forward-word              # Option-Right
