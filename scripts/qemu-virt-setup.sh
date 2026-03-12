#!/bin/bash

lscpu | grep Virtualization

sudo pacman -S qemu-full dnsmasq vde2 openbsd-netcat libguestfs --noconfirm
yay -S bridge-utils virt-manager virt-viewer --noconfirm

sudo systemctl enable --now libvirtd.service

sudo systemctl status libvirtd.service

sudo usermod -aG libvirt,kvm $(whoami)

echo -e "kvm\nkvm_intel" | sudo tee /etc/modules-load.d/kvm.conf  # Intel
echo -e "kvm\nkvm_amd" | sudo tee /etc/modules-load.d/kvm.conf    # AMD   

sudo virsh net-autostart default
sudo virsh net-start default   

virt-manager   