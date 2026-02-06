#!/bin/bash

echo " Enable OS-Prober"
sudo sed -i 's/#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/' /etc/default/grub

sudo grub-mkconfig -o /boot/grub/grub.cfg

echo " Disable OS-Prober"
sudo sed -i 's/GRUB_DISABLE_OS_PROBER=false/#GRUB_DISABLE_OS_PROBER=false/' /etc/default/grub