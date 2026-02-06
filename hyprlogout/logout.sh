#!/bin/bash
#
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

chosen=$(echo -e " Lock\n Logout\n Hibernate\n Suspend\n Reboot\n Shutdown\n Close Menu" | rofi -dmenu -config ~/dotfiles/rofi/config-power.rasi -p "Power")

#chosen=$(echo -e "Lock\nLogout\nReboot\nSuspend\nHibernate\nShutdown\n[Close Menu]" | rofi -dmenu -config ~/dotfiles/rofi/config-power.rasi -p "Power")

if [[ $chosen = " Lock" ]]; then
    swaylock
elif [[ $chosen = " Logout" ]]; then
    hyprctl dispatch exit
elif [[ $chosen = " Reboot" ]]; then
    systemctl reboot
elif [[ $chosen = " Shutdown" ]]; then
    systemctl poweroff
elif [[ $chosen = " Suspend" ]]; then
    systemctl suspend
elif [[ $chosen = " Hibernate" ]]; then
    systemctl hibernate
fi