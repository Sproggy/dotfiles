#/bin/bash
figlet -f 3d "Sys Tools"
echo " System Tools "
sudo pacman -S timeshift file-roller gparted xfce4-power-manager rofi dunst cockpit --noconfirm
echo ""
yay -S gnome-disk-utility --noconfirm
echo ""