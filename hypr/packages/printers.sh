#/bin/bash
figlet -f 3d "Printer"
echo " Printer Packages "
yay -S cups cups-pdf cups-filters nss-mdns system-config-printer cups-browsed libusb ipp-usb xdg-utils colord logrotate --noconfirm
echo ""