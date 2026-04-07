
lscpu | grep Virtualization

which yay

-- YAY REPO IF YOU DON'T HAVE IT --
https://github.com/Jguer/yay
-----------------------------------------------------------

sudo pacman -S --needed linux-headers
-- INSTALL THIS INSTEAD IF YOU ARE ON LTS LINUX --
sudo pacman -S --needed linux-lts-headers

Here is how you know if you are on lts linux 
uname -r

if you see something like this :

6.6.x-lts

You are on lts
----------------------------------------------------------------------------------------

yay -S vmware-keymaps
yay -S vmware-workstation

systemctl list-unit-files | grep vmware

sudo systemctl enable --now vmware-networks.service
sudo systemctl enable --now vmware-usbarbitrator.service

sudo modprobe vmmon
sudo modprobe vmnet
sudo modprobe vmw_vmci