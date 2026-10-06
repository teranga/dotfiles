# Environment shared by zsh and bash, login or not, interactive or not.
# POSIX sh only: .zshenv and .bash_profile both source it. No secrets here (see secrets.sh).

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR="cursor --wait"
export VISUAL="$EDITOR"

# uv tools and ~/.local/bin
case ":$PATH:" in *":$HOME/.local/bin:"*) ;; *) export PATH="$HOME/.local/bin:$PATH" ;; esac

# mise shims give non-interactive shells (scripts, IDEs, agents) the same java/node/python as
# the prompt. Interactive zsh additionally runs `mise activate`, which also sets JAVA_HOME.
case ":$PATH:" in *":$HOME/.local/share/mise/shims:"*) ;; *) export PATH="$HOME/.local/share/mise/shims:$PATH" ;; esac

# AWS defaults (moved from .bash_profile)
export AWS_PROFILE="claude-code"
export AWS_REGION="us-east-1"
export MCP_LOG_LEVEL="ERROR"
