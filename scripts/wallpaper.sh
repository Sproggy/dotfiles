#!/bin/bash
#
# ██       ██            ██  ██
#░██      ░██           ░██ ░██ ██████            ██████
#░██   █  ░██  ██████   ░██ ░██░██░░░██  ██████  ░██░░░██  █████  ██████
#░██  ███ ░██ ░░░░░░██  ░██ ░██░██  ░██ ░░░░░░██ ░██  ░██ ██░░░██░░██░░█
#░██ ██░██░██  ███████  ░██ ░██░██████   ███████ ░██████ ░███████ ░██ ░
#░████ ░░████ ██░░░░██  ░██ ░██░██░░░   ██░░░░██ ░██░░░  ░██░░░░  ░██
#░██░   ░░░██░░████████ ███ ███░██     ░░████████░██     ░░██████░███
#░░       ░░  ░░░░░░░░ ░░░ ░░░ ░░       ░░░░░░░░ ░░       ░░░░░░ ░░░ 
#
# by Sproggy (Corrie Tilcock) (2026)
# ----------------------------------------------------- 

# Select wallpaper
selected=$(ls -1 ~/Pictures/Wallpapers | grep "jpg" | rofi -dmenu -config ~/dotfiles/rofi/config-wallpaper.rasi -p "Wallpapers")

if [ "$selected" ]; then

    echo "Changing theme..."
    # Update wallpaper with pywal16
    wal -q -i ~/Pictures/Wallpapers/$selected

    # Wait for 1 sec
    sleep 1

    # Reload qtile to color bar
    qtile cmd-obj -o cmd -f reload_config

    # Get new theme
    source "$HOME/.cache/wal/colors.sh"

    newwall=$(echo $wallpaper | sed "s|$HOME/Pictures/Wallpapers/||g")

    # ----------------------------------------------------- 
    # Copy selected wallpaper into .cache folder
    # ----------------------------------------------------- 
    cp $wallpaper ~/.cache/current_wallpaper.jpg

    sleep 1

    # Send notification
    notify-send "Colors and Wallpaper updated" "with image $newwall"

    echo "Done."
fi

