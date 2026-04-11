#/bin/bash
figlet -f 3d "VMWare Setup"
echo ""
echo " Check If Virtualisation is enabled "
lscpu | grep Virtualization
sleep 2
echo ""
echo " Check If Virtualisation is enabled "
sudo pacman -S --needed --noconfirm linux-headers
sleep 2
echo ""
echo " Install required files "
yay -S vmware-keymaps --noconfirm
yay -S vmware-workstation --noconfirm
sleep 2
echo ""
echo " Check Units Installed "
systemctl list-unit-files | grep vmware
sleep 2
echo ""
echo " Enable VMWare Services "
sudo systemctl enable --now vmware-networks.service
sudo systemctl enable --now vmware-usbarbitrator.service
sleep 2
echo ""
echo " Add VMWare modprobes "
sudo modprobe vmmon
sudo modprobe vmnet
sudo modprobe vmw_vmci
