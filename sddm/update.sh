#!/bin/bash
echo "

          ████████  ███████   ██     ██ ██████   
         ██░░░░░░██░██░░░░██ ░██    ░██░█░░░░██  
        ██      ░░ ░██   ░██ ░██    ░██░█   ░██  
       ░██         ░███████  ░██    ░██░██████   
       ░██    █████░██░░░██  ░██    ░██░█░░░░ ██ 
       ░░██  ░░░░██░██  ░░██ ░██    ░██░█    ░██ 
        ░░████████ ░██   ░░██░░███████ ░███████  
         ░░░░░░░░  ░░     ░░  ░░░░░░░  ░░░░░░░   


       ████████ ███████   ███████   ████     ████ 
      ██░░░░░░ ░██░░░░██ ░██░░░░██ ░██░██   ██░██ 
     ░██       ░██    ░██░██    ░██░██░░██ ██ ░██ 
     ░█████████░██    ░██░██    ░██░██ ░░███  ░██ 
     ░░░░░░░░██░██    ░██░██    ░██░██  ░░█   ░██ 
            ░██░██    ██ ░██    ██ ░██   ░    ░██ 
      ████████ ░███████  ░███████  ░██        ░██ 
     ░░░░░░░░  ░░░░░░░   ░░░░░░░   ░░         ░░  


  ██     ██              ██             ██           
 ░██    ░██ ██████      ░██            ░██           
 ░██    ░██░██░░░██     ░██  ██████   ██████  █████  
 ░██    ░██░██  ░██  ██████ ░░░░░░██ ░░░██░  ██░░░██ 
 ░██    ░██░██████  ██░░░██  ███████   ░██  ░███████ 
 ░██    ░██░██░░░  ░██  ░██ ██░░░░██   ░██  ░██░░░░  
 ░░███████ ░██     ░░██████░░████████  ░░██ ░░██████ 
  ░░░░░░░  ░░       ░░░░░░  ░░░░░░░░    ░░   ░░░░░░  
"
echo ""
echo " by hyprtk (Kori Tk) (2026) "
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
sudo cp $HOME/dotfiles/sddm/sddm.conf /etc/sddm.conf.d/
echo "File /etc/sddm.conf.d/sddm.conf updated."
echo ""
echo ""
sudo cp ~/.cache/current-wallpaper.png /usr/share/sddm/themes/Sugar-Candy/Backgrounds/
echo "Current wallpaper copied into /usr/share/sddm/themes/Sugar-Candy/Backgrounds/"
echo ""
echo ""
sudo cp $HOME/dotfiles/sddm/theme.conf /usr/share/sddm/themes/Sugar-Candy/
echo "File theme.conf updated in /usr/share/sddm/themes/Sugar-Candy/"
echo ""
echo ""
sudo cp ~/.cache/current-wallpaper.png /root/.cache/current-wallpaper.png
echo ""
echo " Enable OS-Prober"
sudo sed -i 's/#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/' /etc/default/grub
echo ""
sudo sed -i '/^GRUB_BACKGROUND/d' /etc/default/grub
sudo sed -i '/^GRUB_COLOR_NORMAL/d' /etc/default/grub
sudo sed -i '/^GRUB_COLOR_HIGHLIGHT/d' /etc/default/grub
echo ""
echo ""
echo -e 'GRUB_BACKGROUND="/root/.cache/current-wallpaper.png"'| sudo tee -a /etc/default/grub
echo -e 'GRUB_COLOR_NORMAL="white/black"'| sudo tee -a /etc/default/grub
echo -e 'GRUB_COLOR_HIGHLIGHT="white/dark-gray"'| sudo tee -a /etc/default/grub
echo ""
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo ""
echo " Disable OS-Prober"
sudo sed -i 's/GRUB_DISABLE_OS_PROBER=false/#GRUB_DISABLE_OS_PROBER=false/' /etc/default/grub
echo ""
echo ""
echo "GRUB & SDDM Updated with current wallpaper"
echo ""
echo "Refreshing User Font Cache"
fc-cache -f
echo "User Font Cache updated "
echo "Refreshing System Font Cache"
sudo fc-cache -f
echo "System Font cache updated"
echo ""
echo "DONE! Please reboot to test GRUB & sddm update."
sleep 3