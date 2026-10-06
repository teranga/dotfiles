# Tokens come from the macOS Keychain, never from a file in this repo.
# Add or replace one with:   security add-generic-password -U -a "$USER" -s <service> -w
# (prompts for the value, so it never lands in shell history).
_kc() { security find-generic-password -a "$USER" -s "$1" -w 2>/dev/null; }

_v="$(_kc github-pat)";  [ -n "$_v" ] && export GITHUB_PERSONAL_ACCESS_TOKEN="$_v"
_v="$(_kc grafana-mcp)"; [ -n "$_v" ] && export GRAFANA_MCP_TOKEN="$_v"
unset _v
unset -f _kc
