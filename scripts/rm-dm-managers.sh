#!/bin/bash

# Install SDDM if not already installed
sudo pacman -S --noconfirm sddm

# Disable LightDM (and its Plymouth service if present)
sudo systemctl disable lightdm
sudo systemctl disable lightdm-plymouth

# Disable GDM (and its Plymouth service if present)
sudo systemctl disable gdm
sudo systemctl disable gdm-plymouth

# Disable LXDM (and its Plymouth service if present)
sudo systemctl disable lxdm
sudo systemctl disable lxdm-plymouth

# Disable SLiM (and its Plymouth service if present)
sudo systemctl disable slim
sudo systemctl disable slim-plymouth

# Disable KDM (and its Plymouth service if present)
sudo systemctl disable kdm
sudo systemctl disable kdm-plymouth

# Disable Ly (and its Plymouth service if present)
sudo systemctl disable ly
sudo systemctl disable ly-plymouth

# Enable SDDM
sudo systemctl enable sddm

# Optional: Force symlink replacement if needed (e.g., on EndeavourOS)
sudo systemctl enable sddm --force

echo "Switched to SDDM. Reboot to apply changes."   