#!/usr/bin/env fish

for item in * .*
    if contains -- $item "." ".." ".git"
        continue
    end

    if string match -q ".*" -- $item
        cp -r $item ~/
    else
        cp -r $item ~/.config/
    end
end
