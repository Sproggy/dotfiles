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
echo " by Sproggy (Corrie Tilcock) (2023) "
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
sudo cp sddm.conf /etc/sddm.conf.d/
echo "File /etc/sddm.conf.d/sddm.conf updated."
echo ""
sudo cp ~/.cache/current_wallpaper.jpg /usr/share/sddm/themes/sugar-candy/Backgrounds/
echo "Current wallpaper copied into /usr/share/sddm/themes/sugar-candy/Backgrounds/"
echo ""
sudo cp theme.conf /usr/share/sddm/themes/sugar-candy/
echo "File theme.conf updated in /usr/share/sddm/themes/sugar-candy/"
echo ""
sudo cp ~/.cache/current_wallpaper.jpg /root/.cache/current_wallpaper.jpg
echo ""
sudo sed -i '/^GRUB_BACKGROUND/d' /etc/default/grub
sudo sed -i '/^export GRUB_COLOR_NORMAL/d' /etc/default/grub
sudo sed -i '/^export GRUB_COLOR_HIGHLIGHT/d' /etc/default/grub
echo ""
echo -e 'GRUB_BACKGROUND="/root/.cache/current_wallpaper.jpg"'| sudo tee -a /etc/default/grub
echo -e 'export GRUB_COLOR_NORMAL="white/black"'| sudo tee -a /etc/default/grub
echo -e 'export GRUB_COLOR_HIGHLIGHT="white/dark-gray"'| sudo tee -a /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo "GRUB & SDDM Updated with current wallpaper"
echo ""
echo ""
echo "DONE! Please reboot to test GRUB & sddm update."
sleep 3