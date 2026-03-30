#!/bin/bash
# wal-watcher.sh — watches awww for wallpaper changes and runs pywal

LAST_WALL=""

while true; do
    CURRENT=$(awww query 2>/dev/null | grep -oP '(?<=image: ).*')
    if [ -n "$CURRENT" ] && [ "$CURRENT" != "$LAST_WALL" ] && [ -f "$CURRENT" ]; then
        echo "Wallpaper changed: $CURRENT"
        LAST_WALL="$CURRENT"
        # Run pywal and sync colors (skip swww since awww already set it)
        wal -i "$CURRENT" -n -q
        [ -f ~/.cache/wal/colors-wofi.css ]      && cp ~/.cache/wal/colors-wofi.css   ~/.config/wofi/style.css
        [ -f ~/.cache/wal/wob.ini ]              && cp ~/.cache/wal/wob.ini            ~/.config/wob/wob.ini
        [ -f ~/.cache/wal/dunstrc ]              && cp ~/.cache/wal/dunstrc             ~/.config/dunst/dunstrc
        [ -f ~/.cache/wal/hyprland-colors.conf ] && cp ~/.cache/wal/hyprland-colors.conf ~/.config/hypr/hyprland-colors.conf
        bash ~/.config/hypr/scripts/hyprlock_wall.sh "$CURRENT"
        #sudo cp "$CURRENT" /usr/share/sddm/themes/catppuccin/backgrounds/current-wall.jpg 2>/dev/null
        #bash ~/.config/hypr/scripts/sddm-colors.sh
        cp "$CURRENT" ~/.cache/current-wallpaper.png 2>/dev/null
        hyprctl reload 2>/dev/null
        killall waybar 2>/dev/null; ~/dotfiles/waybar/launch.sh
        ~/dotfiles/papirus-icons/scripts/change-icons.sh
        pkill dunst 2>/dev/null; dunst &
        pkill wob 2>/dev/null
        rm -f /tmp/wobpipe
        mkfifo /tmp/wobpipe
        tail -f /tmp/wobpipe | wob -c ~/.config/wob/wob.ini &
    fi
    sleep 1
done
