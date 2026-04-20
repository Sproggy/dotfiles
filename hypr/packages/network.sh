#/bin/bash
figlet -f 3d "Network"
echo " Network Packages "
sudo pacman -S networkmanager network-manager-applet git freerdp curl gvfs gvfs-afc gvfs-dnssd gvfs-goa gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-onedrive gvfs-smb gvfs-wsdd ntfs-3g samba --noconfirm
echo ""