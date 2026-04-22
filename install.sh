#!/usr/bin/env bash
set -euo pipefail

if [ $# -eq 0 ]; then
    echo "Usage: $0 <host>"
    exit 1
fi

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
HOST="$1"
HOSTDIR="$DOTFILES/$HOST"
CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}"

if [ ! -d "$HOSTDIR" ]; then
    echo "ERROR: unknown host '$HOST'"
    echo "Available: $(ls -d "$DOTFILES"/*/ 2>/dev/null | xargs -n1 basename | tr '\n' ' ')"
    exit 1
fi
ERRORS=()

link() {
    local src="$HOSTDIR/$1"
    local dest="$CONFIG/$1"

    if [ ! -d "$src" ]; then
        echo "SKIP: $1 — source directory does not exist"
        return 1
    fi

    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "ERROR: $1 — $dest already exists"
        ERRORS+=("$1")
        return 1
    fi

    ln -s "$src" "$dest"
    echo "OK: $1 → $dest"
}

copy_file() {
    local src="$HOSTDIR/$1"
    local dest="$2"

    if [ ! -f "$src" ]; then
        echo "SKIP: $src — file does not exist"
        return 1
    fi

    cp "$src" "$dest"
    echo "OK: $src → $dest"
}

echo "Symlinking $HOST configurations into $CONFIG ..."

link alacritty
link bspwm
link fastfetch
link nvim
link picom
link polybar
link sxhkd

copy_file bash/bashrc "$HOME/.bashrc"

if [ ${#ERRORS[@]} -gt 0 ]; then
    echo ""
    echo "Failed — the following targets already existed:"
    printf '  - %s\n' "${ERRORS[@]}"
    echo "Remove or rename them, then re-run."
    exit 1
fi

echo ""
echo "Done. All configurations symlinked."
