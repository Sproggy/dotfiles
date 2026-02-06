#/bin/bash
figlet -f 3d "Network"
echo " Network Packages "
sudo pacman -S networkmanager network-manager-applet git freerdp curl gvfs ntfs-3g samba --noconfirm
echo ""