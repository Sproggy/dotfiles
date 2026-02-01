#!/bin/bash
echo ""
echo ""
echo "          ████████  ███████   ██     ██ ██████   "
echo "         ██░░░░░░██░██░░░░██ ░██    ░██░█░░░░██  "
echo "        ██      ░░ ░██   ░██ ░██    ░██░█   ░██  "
echo "       ░██         ░███████  ░██    ░██░██████   "
echo "       ░██    █████░██░░░██  ░██    ░██░█░░░░ ██ "
echo "       ░░██  ░░░░██░██  ░░██ ░██    ░██░█    ░██ "
echo "        ░░████████ ░██   ░░██░░███████ ░███████  "
echo "         ░░░░░░░░  ░░     ░░  ░░░░░░░  ░░░░░░░   "
echo ""
echo ""
echo "       ████████ ███████   ███████   ████     ████ "
echo "      ██░░░░░░ ░██░░░░██ ░██░░░░██ ░██░██   ██░██ "
echo "     ░██       ░██    ░██░██    ░██░██░░██ ██ ░██ "
echo "     ░█████████░██    ░██░██    ░██░██ ░░███  ░██ "
echo "     ░░░░░░░░██░██    ░██░██    ░██░██  ░░█   ░██ "
echo "            ░██░██    ██ ░██    ██ ░██   ░    ░██ "
echo "      ████████ ░███████  ░███████  ░██        ░██ "
echo "     ░░░░░░░░  ░░░░░░░   ░░░░░░░   ░░         ░░  "
echo ""
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
echo " by Sproggy (Corrie Tilcock) (2024) "
echo " ------------------------------------------------------------------- "
echo ""
while true; do
    read -p "Update the background wallpaper of GRUB & sddm to the current wallpaper NOW? (Yy/Nn): " yn
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
echo ""
sudo rm -rf /usr/share/grub/themes/*
sudo rm -rf /boot/grub/themes/*
echo ""
sudo cp sddm.conf /etc/sddm.conf.d/
echo "File /etc/sddm.conf.d/sddm.conf updated."
echo ""
echo ""
sudo cp ~/.cache/current_wallpaper.jpg /usr/share/sddm/themes/Sugar-Candy/Backgrounds/
echo "Current wallpaper copied into /usr/share/sddm/themes/Sugar-Candy/Backgrounds/"
echo ""
echo ""
sudo cp theme.conf /usr/share/sddm/themes/Sugar-Candy/
echo "File theme.conf updated in /usr/share/sddm/themes/Sugar-Candy/"
echo ""
echo ""
sudo cp ~/.cache/current_wallpaper.jpg /root/.cache/current_wallpaper.jpg
echo ""
echo ""
sudo sed -i '/^GRUB_BACKGROUND/d' /etc/default/grub
sudo sed -i '/^export GRUB_COLOR_NORMAL/d' /etc/default/grub
sudo sed -i '/^export GRUB_COLOR_HIGHLIGHT/d' /etc/default/grub
echo ""
echo ""
echo -e 'GRUB_BACKGROUND="/root/.cache/current_wallpaper.jpg"'| sudo tee -a /etc/default/grub
echo -e 'export GRUB_COLOR_NORMAL="white/black"'| sudo tee -a /etc/default/grub
echo -e 'export GRUB_COLOR_HIGHLIGHT="white/dark-gray"'| sudo tee -a /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo ""
echo ""
echo "GRUB & SDDM Updated with current wallpaper"
echo ""
echo ""
echo "Refreshing User Fonts Cache"
echo ""
echo ""
fc-cache -f -v
echo ""
echo ""
echo "Refreshing System Fonts Cache"
echo ""
echo ""
sudo fc-cache -f -v
echo "Font cache updated"
echo ""
echo ""
echo "DONE! Please reboot to test GRUB & sddm update."
sleep 3