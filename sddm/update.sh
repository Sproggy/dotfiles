#!/bin/bash
echo ""
echo "  ██     ██              ██             ██           "
echo " ░██    ░██ ██████      ░██            ░██           "
echo " ░██    ░██░██░░░██     ░██  ██████   ██████  █████  "
echo " ░██    ░██░██  ░██  ██████ ░░░░░░██ ░░░██░  ██░░░██ "
echo " ░██    ░██░██████  ██░░░██  ███████   ░██  ░███████ "
echo " ░██    ░██░██░░░  ░██  ░██ ██░░░░██   ░██  ░██░░░░  "
echo " ░░███████ ░██     ░░██████░░████████  ░░██ ░░██████ "
echo "  ░░░░░░░  ░░       ░░░░░░  ░░░░░░░░    ░░   ░░░░░░  "
echo ""
echo ""
echo "   ████████ ███████   ███████   ████     ████ "
echo "  ██░░░░░░ ░██░░░░██ ░██░░░░██ ░██░██   ██░██ "
echo " ░██       ░██    ░██░██    ░██░██░░██ ██ ░██ "
echo " ░█████████░██    ░██░██    ░██░██ ░░███  ░██ "
echo " ░░░░░░░░██░██    ░██░██    ░██░██  ░░█   ░██ "
echo "        ░██░██    ██ ░██    ██ ░██   ░    ░██ "
echo "  ████████ ░███████  ░███████  ░██        ░██ "
echo " ░░░░░░░░  ░░░░░░░   ░░░░░░░   ░░         ░░  "
echo ""
echo " by Sproggy (Corrie Tilcock) (2023) "
echo " ------------------------------------------------------------------- "

while true; do
    read -p "Update the background wallpaper of sddm to the current wallpaper NOW? (Yy/Nn): " yn
    case $yn in
        [Yy]* )
            echo "Update started."
        break;;
        [Nn]* ) 
            echo "Update is Aborted"
            exit;
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done
echo ""
if [ ! -d /etc/sddm.conf.d/ ]; then
    sudo mkdir /etc/sddm.conf.d
    echo "Folder /etc/sddm.conf.d created."
fi

sudo cp sddm.conf /etc/sddm.conf.d/
echo "File /etc/sddm.conf.d/sddm.conf updated."

sudo cp ~/.cache/current_wallpaper.jpg /usr/share/sddm/themes/sugar-candy/Backgrounds/
echo "Current wallpaper copied into /usr/share/sddm/themes/sugar-candy/Backgrounds/"

sudo cp theme.conf /usr/share/sddm/themes/sugar-candy/
echo "File theme.conf updated in /usr/share/sddm/themes/sugar-candy/"

sudo cp ~/.cache/current_wallpaper.jpg /root/.cache/current_wallpaper.jpg

sudo sed -i '/^GRUB_BACKGROUND/d' /etc/default/grub

echo -e 'GRUB_BACKGROUND="~/.cache/current.jpg"'| sudo tee -a /etc/default/grub

echo ""
echo "DONE! Please logout to test sddm."
