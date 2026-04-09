#!/bin/bash
echo " Enable OS-Prober"
sudo sed -i 's/#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/' /etc/default/grub
sudo sed -i '/^GRUB_BACKGROUND/d' /etc/default/grub
sudo sed -i '/^GRUB_COLOR_NORMAL/d' /etc/default/grub
sudo sed -i '/^GRUB_COLOR_HIGHLIGHT/d' /etc/default/grub
echo -e 'GRUB_BACKGROUND="/root/.cache/current-wallpaper.png"'| sudo tee -a /etc/default/grub
echo -e 'GRUB_COLOR_NORMAL="white/black"'| sudo tee -a /etc/default/grub
echo -e 'GRUB_COLOR_HIGHLIGHT="white/dark-gray"'| sudo tee -a /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo " Disable OS-Prober"
sudo sed -i 's/GRUB_DISABLE_OS_PROBER=false/#GRUB_DISABLE_OS_PROBER=false/' /etc/default/grub
sleep 3