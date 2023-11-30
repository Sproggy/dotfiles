#!/bin/bash
#
# ------------------------------------------------------
# Confirm Start
# ------------------------------------------------------
source $(dirname "$0")/scripts/library.sh
clear
echo ""
echo "  ██      ██                          ██                         ██ "
echo " ░██     ░██  ██   ██ ██████         ░██                        ░██ "
echo " ░██     ░██ ░░██ ██ ░██░░░██ ██████ ░██  ██████   ███████      ░██ "
echo " ░██████████  ░░███  ░██  ░██░░██░░█ ░██ ░░░░░░██ ░░██░░░██  ██████ "
echo " ░██░░░░░░██   ░██   ░██████  ░██ ░  ░██  ███████  ░██  ░██ ██░░░██ "
echo " ░██     ░██   ██    ░██░░░   ░██    ░██ ██░░░░██  ░██  ░██░██  ░██ "
echo " ░██     ░██  ██     ░██     ░███    ███░░████████ ███  ░██░░██████ "
echo " ░░      ░░  ░░      ░░      ░░░    ░░░  ░░░░░░░░ ░░░   ░░  ░░░░░░  "
echo "  "
echo " by Sproggy (Corrie Tilcock) (2023) "
echo " ------------------------------------------------------------------- "
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
    "xorg-xhost"

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
    "p7zip"
    "unzip"
    "unrar"
    "nwg-look"
);

# ------------------------------------------------------
# Install required packages
# ------------------------------------------------------
_installPackagesPacman "${packagesPacman[@]}";
_installPackagesYay "${packagesYay[@]}";


# ------------------------------------------------------
# Confirm Start
# ------------------------------------------------------
source $(dirname "$0")/scripts/library.sh
clear
echo "   ███████    ██████████ ██  ██          "
echo "   ██░░░░░██  ░░░░░██░░░ ░░  ░██         "
echo "  ██     ░░██     ░██     ██ ░██  █████  "
echo " ░██      ░██     ░██    ░██ ░██ ██░░░██ "
echo " ░██    ██░██     ░██    ░██ ░██░███████ "
echo " ░░██  ░░ ██      ░██    ░██ ░██░██░░░░  "
echo "  ░░███████ ██    ░██    ░██ ███░░██████ "
echo "   ░░░░░░░ ░░     ░░     ░░ ░░░  ░░░░░░  "
echo ""
echo " by Sproggy (Corrie Tilcock) (2023) "
echo " ------------------------------------------------------------------- "

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
    "qtile" 
    "polybar"
    "picom"
    "scrot"
    "slock"
);

# ------------------------------------------------------
# Install required packages
# ------------------------------------------------------
_installPackagesPacman "${packagesPacman[@]}";

# ------------------------------------------------------
# Launch Thunar
# ------------------------------------------------------
echo ""
echo "-> Launching Thunar to populate xfconf"
thunar &
sleep 5
# ------------------------------------------------------
# Close Thunar
# ------------------------------------------------------
echo ""
echo "-> Closing Thunar"
killall thunar

# ------------------------------------------------------
# Enable Bluetooth
# ------------------------------------------------------
sudo systemctl start bluetooth
sudo systemctl enable bluetooth
sudo grub-mkconfig -o /boot/grub/grub.cfg



echo ""
echo "DONE!"
echo "NEXT: Update the keyboard layout and screen resolution in ~/dotfiles/hypr/hyprland.conf"
echo "Then proceed with with 3-dotfiles.sh"

