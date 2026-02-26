#/bin/bash
figlet -f 3d "Sys Tools"
echo " System Tools "
sudo pacman -S timeshift file-roller xfce4-power-manager rofi dunst cockpit --noconfirm
echo ""
yay -S gnome-disk-utility octopi --noconfirm
echo ""