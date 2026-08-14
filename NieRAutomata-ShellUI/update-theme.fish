#!/usr/bin/env fish
 
set config_dir "$HOME/.config"
set home_dir "$HOME"
set not_updated
 
for item in (find . -mindepth 1 -maxdepth 1 -printf '%f\n' | sort)
    if test -e "$config_dir/$item"
        cp -r "$item" "$config_dir/"
    else if test -e "$home_dir/$item"
        cp -r "$item" "$home_dir/"
    else
        set not_updated $not_updated $item
    end
end
 
echo "Not updated (no match in .config or ~):"
for item in $not_updated
    echo "  - $item"
end
 

