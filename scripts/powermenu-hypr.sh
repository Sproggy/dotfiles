#!/bin/bash
#  ____                                                    
# |  _ \ _____      _____ _ __ _ __ ___   ___ _ __  _   _  
# | |_) / _ \ \ /\ / / _ \ '__| '_ ` _ \ / _ \ '_ \| | | | 
# |  __/ (_) \ V  V /  __/ |  | | | | | |  __/ | | | |_| | 
# |_|   \___/ \_/\_/ \___|_|  |_| |_| |_|\___|_| |_|\__,_| 
#                                                          
#  
# by Corrie Tilcock (2024)
# ----------------------------------------------------- 

option1="  lock"
option2="  logout"
option3="  reboot"
option4="  power off"

options="$option1\n"
options="$options$option2\n"
options="$options$option3\n$option4"

choice=$(echo -e "$options" | rofi -dmenu -i -no-show-icons -l 4 -width 30 -p "Powermenu") 

case $choice in
	$option1)
		swaylock ;;
	$option2)
        # loginctl terminate-user $USER # For command line based login
		hyprctl dispatch exit ;; # For display manager login
	$option3)
		systemctl reboot ;;
	$option4)
		systemctl poweroff ;;
esac

