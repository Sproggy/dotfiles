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
echo "Checking if sddm config directory exists"
echo ""
if [ ! -d /etc/sddm.conf.d/ ]; then
    sudo mkdir /etc/sddm.conf.d
    echo "Folder /etc/sddm.conf.d created."
else
    echo "/etc/sddm.conf.d/ already exists"
fi
echo ""
sudo rm -rf /usr/share/grub/themes/*
sudo rm -rf /boot/grub/themes/*
echo ""
echo ""
sleep 2
sudo cp sddm.conf /etc/sddm.conf.d/
echo "empty conf file sddm.conf copied."
echo ""
echo ""
sleep 2
sudo cp ~/.cache/current_wallpaper.jpg /usr/share/sddm/themes/Sugar-Candy/Backgrounds/
echo "Current wallpaper copied into /usr/share/sddm/themes/Sugar-Candy/Backgrounds/"
echo ""
echo ""
sleep 2
sudo cp theme.conf /usr/share/sddm/themes/Sugar-Candy/
echo "File theme.conf updated in /usr/share/sddm/themes/Sugar-Candy/"
echo ""
echo ""
sleep 2
sudo cp ~/.cache/current_wallpaper.jpg /root/.cache/current_wallpaper.jpg
echo ""
echo "Wallpaper cache updated"
echo ""
sleep 2
echo " Enable OS-Prober"
sudo sed -i '/^export GRUB_BACKGROUND/d' /etc/default/grub
sudo sed -i '/^export GRUB_COLOR_NORMAL/d' /etc/default/grub
sudo sed -i '/^export GRUB_COLOR_HIGHLIGHT/d' /etc/default/grub
echo ""
echo -e 'GRUB_BACKGROUND="/root/.cache/current_wallpaper.jpg"'| sudo tee -a /etc/default/grub
echo -e 'GRUB_COLOR_NORMAL="white/black"'| sudo tee -a /etc/default/grub
echo -e 'GRUB_COLOR_HIGHLIGHT="white/dark-gray"'| sudo tee -a /etc/default/grub
echo ""
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo ""
echo " Disable OS-Prober"
sudo sed -i 's/GRUB_DISABLE_OS_PROBER=false/#GRUB_DISABLE_OS_PROBER=false/' /etc/default/grub
echo ""
sleep 2
echo "GRUB & SDDM Updated with current wallpaper"
echo ""
echo "Refreshing User Font Cache"
echo ""
fc-cache -f -v
echo ""
echo "User Font Cache updated "
echo ""
echo "Refreshing System Font Cache"
echo ""
echo ""
sudo fc-cache -f -v
echo ""
echo "System Font cache updated"
echo ""
echo "DONE! Please reboot to test GRUB & sddm update."
sleep 3