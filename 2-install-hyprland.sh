#!/bin/bash
#  _   _                  _                 _  
# | | | |_   _ _ __  _ __| | __ _ _ __   __| | 
# | |_| | | | | '_ \| '__| |/ _` | '_ \ / _` | 
# |  _  | |_| | |_) | |  | | (_| | | | | (_| | 
# |_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_| 
#        |___/|_|                              
#  
# by Stephan Raabe (2023) 
# Forked by Corrie Tilcock (10/2023)
# ----------------------------------------------------- 
# Install Script for Hyprland
# ------------------------------------------------------

# ------------------------------------------------------
# Confirm Start
# ------------------------------------------------------
source $(dirname "$0")/scripts/library.sh
clear
echo "  _   _                  _                 _  "
echo " | | | |_   _ _ __  _ __| | __ _ _ __   __| | "
echo " | |_| | | | | ,_ \| ,__| |/ _\ | ,_ \ / _, | "
echo " |  _  | |_| | |_) | |  | | (_| | | | | (_| | "
echo " |_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_| "
echo "        |___/|_|                              "
echo "                             " 
echo "by Stephan Raabe (2023)"
echo "Forked by Corrie Tilcock (10/2023)"
echo "----------------------------------------------"
echo ""

while true; do
    read -p "DO YOU WANT TO START THE INSTALLATION NOW? (Yy/Nn): " yn
    case $yn in
        [Yy]* )
            echo "Installation started."
        break;;
        [Nn]* ) 
            exit;
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done
echo ""

# ------------------------------------------------------
# Install required packages
# ------------------------------------------------------
echo ""
echo "-> Install main packages"
packagesPacman=(
    "hyprland" 
    "xdg-desktop-portal-wlr" 
    "waybar" 
    "grim" 
    "slurp"
    "swayidle"
    "swappy"
    "cliphist"
);

packagesYay=(
    "swww" 
    "swaylock-effects" 
    "wlogout"
    "gvfs-afc"
    "gvfs-goa"
    "gvfs-gphoto2"
    "gvfs-mtp"
    "gvfs-nfs"
    "gvfs-smb"
    "thunar-archive-plugin"
    "thunar-custom-actions"
    "thunar-media-tags-plugin"
    "thunar-vcs-plugin"
    "thunar-volman"
    "p7zip-gui"
    "unzip"
    "unrar"
);

# ------------------------------------------------------
# Install required packages
# ------------------------------------------------------
_installPackagesPacman "${packagesPacman[@]}";
_installPackagesYay "${packagesYay[@]}";

echo ""
echo "DONE!"
echo "NEXT: Update the keyboard layout and screen resolution in ~/dotfiles/hypr/hyprland.conf"
echo "Then proceed with with 3-dotfiles.sh"

