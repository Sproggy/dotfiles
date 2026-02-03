#!/usr/bin/env bash
#                _ _
# ██       ██            ██  ██
#░██      ░██           ░██ ░██ ██████            ██████
#░██   █  ░██  ██████   ░██ ░██░██░░░██  ██████  ░██░░░██  █████  ██████
#░██  ███ ░██ ░░░░░░██  ░██ ░██░██  ░██ ░░░░░░██ ░██  ░██ ██░░░██░░██░░█
#░██ ██░██░██  ███████  ░██ ░██░██████   ███████ ░██████ ░███████ ░██ ░
#░████ ░░████ ██░░░░██  ░██ ░██░██░░░   ██░░░░██ ░██░░░  ░██░░░░  ░██
#░██░   ░░░██░░████████ ███ ███░██     ░░████████░██     ░░██████░███
#░░       ░░  ░░░░░░░░ ░░░ ░░░ ░░       ░░░░░░░░ ░░       ░░░░░░ ░░░
# -----------------------------------------------------
# Restore last wallpaper
# -----------------------------------------------------

# -----------------------------------------------------
# Set defaults
# -----------------------------------------------------

cache_folder="$HOME/.cache"

defaultwallpaper="$HOME/dotfiles/Wallpapers/default.jpg"

cachefile="$cache_folder/current_wallpaper"

# -----------------------------------------------------
# Get current wallpaper
# -----------------------------------------------------

if [ -f "$cachefile" ]; then
    sed -i "s|~|$HOME|g" "$cachefile"
    wallpaper=$(cat $cachefile)
    if [ -f $wallpaper ]; then
        echo ":: Wallpaper $wallpaper exists"
    else
        echo ":: Wallpaper $wallpaper does not exist. Using default."
        wallpaper=$defaultwallpaper
    fi
else
    echo ":: $cachefile does not exist. Using default wallpaper."
    wallpaper=$defaultwallpaper
fi

# -----------------------------------------------------
# Set wallpaper
# -----------------------------------------------------

echo ":: Setting wallpaper with source image $wallpaper"
if [ -f ~/.local/bin/waypaper ]; then
    export PATH=$PATH:~/.local/bin/
fi
waypaper --wallpaper "$wallpaper"
