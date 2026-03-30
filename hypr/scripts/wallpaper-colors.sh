#!/bin/bash
WALLPAPER="$1"
[ -f "$WALLPAPER" ] || exit 1
wal -i "$WALLPAPER" -n -q
[ -f ~/.cache/wal/colors-wofi.css ]      && cp ~/.cache/wal/colors-wofi.css   ~/.config/wofi/style.css
[ -f ~/.cache/wal/wob.ini ]              && cp ~/.cache/wal/wob.ini            ~/.config/wob/wob.ini
[ -f ~/.cache/wal/dunstrc ]              && cp ~/.cache/wal/dunstrc             ~/.config/dunst/dunstrc
[ -f ~/.cache/wal/hyprland-colors.conf ] && cp ~/.cache/wal/hyprland-colors.conf ~/.config/hypr/hyprland-colors.conf
bash ~/.config/hypr/scripts/hyprlock_wall.sh "$WALLPAPER"
#sudo cp "$WALLPAPER" /usr/share/sddm/themes/catppuccin/backgrounds/current-wall.jpg 2>/dev/null
#bash ~/.config/hypr/scripts/sddm-colors.sh
cp "$WALLPAPER" ~/.cache/current-wallpaper.png 2>/dev/null
hyprctl reload 2>/dev/null
killall waybar 2>/dev/null; ~/dotfiles/waybar/launch.sh
~/dotfiles/papirus-icons/scripts/change-icons.sh
pkill dunst 2>/dev/null; dunst &
pkill wob 2>/dev/null
rm -f /tmp/wobpipe && mkfifo /tmp/wobpipe
tail -f /tmp/wobpipe | wob -c ~/.config/wob/wob.ini &
