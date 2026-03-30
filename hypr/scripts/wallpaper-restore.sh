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
# Runs on startup — restores last wallpaper and pywal colors

WALLPAPER_CACHE="$HOME/.cache/wal/wal"
FALLBACK="$HOME/dotfiles/Wallpapers/default.png"

sleep 1

WALLPAPER=$(cat "$WALLPAPER_CACHE" 2>/dev/null)
[ -f "$WALLPAPER" ] || WALLPAPER="$FALLBACK"
[ -f "$WALLPAPER" ] || exit 1

awww img "$WALLPAPER" --transition-type fade --transition-duration 2 --transition-fps 60

wal -i "$WALLPAPER" -n -q

[ -f ~/.cache/wal/colors-wofi.css ]      && cp ~/.cache/wal/colors-wofi.css    ~/.config/wofi/style.css
[ -f ~/.cache/wal/wob.ini ]              && cp ~/.cache/wal/wob.ini             ~/.config/wob/wob.ini
[ -f ~/.cache/wal/dunstrc ]              && cp ~/.cache/wal/dunstrc              ~/.config/dunst/dunstrc
[ -f ~/.cache/wal/hyprland-colors.conf ] && cp ~/.cache/wal/hyprland-colors.conf ~/.config/hypr/hyprland-colors.conf

killall waybar 2>/dev/null; ~/dotfiles/waybar/launch.sh
~/dotfiles/papirus-icons/scripts/change-icons.sh