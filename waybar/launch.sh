#!/bin/sh
#  ____  _             _    __        __          _                 
# / ___|| |_ __ _ _ __| |_  \ \      / /_ _ _   _| |__   __ _ _ __  
# \___ \| __/ _` | '__| __|  \ \ /\ / / _` | | | | '_ \ / _` | '__| 
#  ___) | || (_| | |  | |_    \ V  V / (_| | |_| | |_) | (_| | |    
# |____/ \__\__,_|_|   \__|    \_/\_/ \__,_|\__, |_.__/ \__,_|_|    
#                                           |___/                   
# by Corrie Tilcock (2024)
# ----------------------------------------------------- 

# ----------------------------------------------------- 
# Quit all running waybar instances
# ----------------------------------------------------- 
killall waybar

# ----------------------------------------------------- 
# Default theme: /THEMEFOLDER;/VARIATION
# ----------------------------------------------------- 
themestyle="/Top;/Top/light"

# ----------------------------------------------------- 
# Get current theme information from .cache/.themestyle.sh
# ----------------------------------------------------- 
if [ -f ~/.cache/.themestyle.sh ]; then
    themestyle=$(cat ~/.cache/.themestyle.sh)
else
    touch ~/.cache/.themestyle.sh
    echo "$themestyle" > ~/.cache/.themestyle.sh
fi

IFS=';' read -ra arrThemes <<< "$themestyle"
echo ${arrThemes[0]}

if [ ! -f ~/dotfiles/waybar/themes${arrThemes[1]}/style.css ]; then
    themestyle="/Top;/Top/light"
fi

# ----------------------------------------------------- 
# Loading the configuration and style file based on the username
# ----------------------------------------------------- 
if [[ $USER = "raabe" ]]
then
    waybar -c ~/dotfiles/waybar/themes${arrThemes[0]}/myconfig -s ~/dotfiles/waybar/themes${arrThemes[1]}/style.css &
else
    waybar -c ~/dotfiles/waybar/themes${arrThemes[0]}/config -s ~/dotfiles/waybar/themes${arrThemes[1]}/style.css &
fi 
