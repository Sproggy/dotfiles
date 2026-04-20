#/bin/bash
figlet -f 3d "VMWare Setup"
echo ""
echo " Check If Virtualisation is enabled "
lscpu | grep Virtualization
sleep 2
echo ""
echo " Check If Virtualisation is enabled "
echo "
#########################################################
#                                                       #
#               Which Kernel do you have?               #
#                                                       #
#########################################################

1) linux
2) linux-hardened
3) linux-lts
4) linux-zen
Defaults to linux if you choose do not make selection
"
echo ""
read LINUX
case $LINUX in
1)
  sudo pacman -S --noconfirm linux linux-headers;;
2)
  sudo pacman -S --noconfirm linux-hardened linux-hardened-headers;;
3)
  sudo pacman -S --noconfirm linux-lts linux-lts-headers;;
4)
  sudo pacman -S --noconfirm linux-zen linux-zen-headers;;
*)
  sudo pacman -S --noconfirm linux linux-headers;;
esac
echo ""
clear
echo "
#########################################################
#                                                       #
#        Your kernel-headers have been installed        #
#                                                       #
#########################################################
"
sleep 2
echo ""
echo " Install required files "
yay -S vmware-keymaps --noconfirm
yay -S vmware-workstation open-vm-tools --noconfirm
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
