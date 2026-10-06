# Order matters: fzf-tab after compinit, syntax highlighting last.
source "$HOME/.dotfiles/plugins/fzf-tab/fzf-tab.plugin.zsh"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --icons=always $realpath'
zstyle ':fzf-tab:complete:z:*'  fzf-preview 'eza -1 --color=always --icons=always $realpath'
zstyle ':fzf-tab:*' switch-group '<' '>'

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
