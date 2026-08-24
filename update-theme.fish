#!/usr/bin/env fish

if not command -q rsync
    echo "rsync not found. Install it — needed for diff/mtime-aware sync."
    exit 1
end

set config_dir "$HOME/.config"
set home_dir "$HOME"
set not_updated
set updated
set unchanged

for item in * .*
    if contains -- $item "." ".." ".git"
        continue
    end

    if test -e "$config_dir/$item"
        set src "$config_dir/$item"
    else if test -e "$home_dir/$item"
        set src "$home_dir/$item"
    else
        set not_updated $not_updated $item
        continue
    end

    # -a: recurse + preserve attrs (dir-safe, mirrors old cp -r)
    # -u: skip if dest ($item here) is newer than src (never regress local rice copy)
    # -c: compare by checksum, not mtime/size — catches "touched but identical" and
    #     avoids false negatives when mtimes are close/unreliable across filesystems
    # --delete: drop files removed on the source side, keeping rice copy a true mirror
    # --itemize-changes: prints one line per file actually transferred; empty output = no diff
    set changes (rsync -auc --delete --itemize-changes "$src" ./ 2>&1)

    if test -n "$changes"
        set updated $updated $item
    else
        set unchanged $unchanged $item
    end
end

if test -n "$updated"
    echo "Updated (newer + different):"
    for item in $updated
        echo "  - $item"
    end
end

if test -n "$unchanged"
    echo "Unchanged (identical, skipped):"
    for item in $unchanged
        echo "  - $item"
    end
end

if test -n "$not_updated"
    echo "Not updated (no match in .config or ~):"
    for item in $not_updated
        echo "  - $item"
    end
end
