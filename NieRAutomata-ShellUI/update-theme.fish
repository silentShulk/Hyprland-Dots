#!/usr/bin/env fish

set config_dir "$HOME/.config"
set home_dir "$HOME"
set not_updated

for item in * .*
    if contains -- $item "." ".." ".git"
        continue
    end

    if test -e "$config_dir/$item"
        cp -r "$config_dir/$item" .
    else if test -e "$home_dir/$item"
        cp -r "$home_dir/$item" .
    else
        set not_updated $not_updated $item
    end
end

if test -n "$not_updated"
    echo "Not updated (no match in .config or ~):"
    for item in $not_updated
        echo "  - $item"
    end
end
