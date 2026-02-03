#!/bin/bash
# ██      ██
#░██     ░██  ██   ██ ██████
#░██     ░██ ░░██ ██ ░██░░░██ ██████
#░██████████  ░░███  ░██  ░██░░██░░█
#░██░░░░░░██   ░██   ░██████  ░██ ░
#░██     ░██   ██    ░██░░░   ░██
#░██     ░██  ██     ░██     ░███
#░░      ░░  ░░      ░░      ░░░
#
# ██                                           ██
#░██                 █████                    ░██
#░██        ██████  ██░░░██  ██████  ██   ██ ██████
#░██       ██░░░░██░██  ░██ ██░░░░██░██  ░██░░░██░
#░██      ░██   ░██░░██████░██   ░██░██  ░██  ░██
#░██      ░██   ░██ ░░░░░██░██   ░██░██  ░██  ░██
#░████████░░██████   █████ ░░██████ ░░██████  ░░██
#░░░░░░░░  ░░░░░░   ░░░░░   ░░░░░░   ░░░░░░    ░░
#                                                                        
# by Sproggy (Corrie Tilcock) (2026)
# ----------------------------------------------------- 

# ----------------------------------------------------- 
# Default actions folder
# ----------------------------------------------------- 
actions_path="$HOME/dotfiles/hyprlogout/actions"

# ----------------------------------------------------- 
# Initialize arrays
# ----------------------------------------------------- 
listActions=""
listNames=""

# ----------------------------------------------------- 
# Read theme folder
# ----------------------------------------------------- 
options=$(find $actions_path -maxdepth 2 -type d)
for value in $options
do
    if [ ! $value == "$actions_path" ]; then
        if [ $(find $value -maxdepth 1 -type d | wc -l) = 1 ]; then
            result=$(echo $value | sed "s#$HOME/dotfiles/hyprlogout/#/#g")
            IFS='/' read -ra arrActions <<< "$result"
            listActions[${#listActions[@]}]="/${arrActions[1]};$result"
            if [ -f $actions_path$result/config.sh ]; then
                source $actions_path$result/config.sh
                listNames+="$action_name\n"
            else
                listNames+="/${arrActions[1]};$result\n"
            fi
        fi
    fi
done

# ----------------------------------------------------- 
# Show rofi dialog
# ----------------------------------------------------- 
listNames=${listNames::-2}
choice=$(echo -e "$listNames" | rofi -dmenu -config ~/dotfiles/rofi/config-wallpaper.rasi -no-show-icons -width 30 -p "Actions" -format i) 
