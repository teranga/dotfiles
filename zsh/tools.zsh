# Tool hooks, cached: each tool's init script is generated once and regenerated only when
# the tool's binary changes (brew upgrade). Saves ~25 ms per new tab over plain eval.
_cached_init() { # _cached_init <name> <command…>
  local bin="${commands[$2]}" cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh-init/$1.zsh"
  if [[ ! -s "$cache" || "$bin" -nt "$cache" ]]; then
    mkdir -p "${cache:h}" && "${@:2}" >| "$cache"
  fi
  source "$cache"
}

_cached_init mise mise activate zsh
_cached_init direnv direnv hook zsh
_cached_init zoxide zoxide init zsh

# fzf — fd for listing, Catppuccin Mocha colours, bat/eza previews.
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS=" \
--height 40% --layout reverse --border rounded \
--color=bg+:#313244,bg:-1,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a,border:#6c7086,label:#cdd6f4"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:300 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --level=2 --color=always --icons=always {}'"
_cached_init fzf fzf --zsh
bindkey '^I' fzf-tab-complete   # fzf --zsh takes Tab for its ** trigger; give it back to fzf-tab

# Atuin owns Ctrl-R (after fzf, which also binds it). Up-arrow keeps zsh's own history.
_cached_init atuin atuin init zsh --disable-up-arrow

export BAT_THEME="Catppuccin Mocha"
export EZA_CONFIG_DIR="$HOME/.config/eza"

_cached_init starship starship init zsh
unfunction _cached_init
