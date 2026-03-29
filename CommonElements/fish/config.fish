source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

starship init fish | source

set -gx EDITOR nvim
set -gx VISUAL nvim

set -gx GITHUB_MCP_PAT "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"
