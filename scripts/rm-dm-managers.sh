#!/bin/bash
#
#  ███████   ████     ████
# ░██░░░░██ ░██░██   ██░██
# ░██    ░██░██░░██ ██ ░██
# ░██    ░██░██ ░░███  ░██
# ░██    ░██░██  ░░█   ░██
# ░██    ██ ░██   ░    ░██
# ░███████  ░██        ░██
# ░░░░░░░   ░░         ░░
#
#    ██████   ██                            ██     ██
#   ██░░░░██ ░██                           ░██    ░██ ██████
#  ██    ░░  ░██  █████   ██████   ███████ ░██    ░██░██░░░██
# ░██        ░██ ██░░░██ ░░░░░░██ ░░██░░░██░██    ░██░██  ░██
# ░██        ░██░███████  ███████  ░██  ░██░██    ░██░██████
# ░░██    ██ ░██░██░░░░  ██░░░░██  ░██  ░██░██    ░██░██░░░
#  ░░██████  ███░░██████░░████████ ███  ░██░░███████ ░██
#   ░░░░░░  ░░░  ░░░░░░  ░░░░░░░░ ░░░   ░░  ░░░░░░░  ░░
#  
# by hyprtk (Kori Tk) (2026)
# ----------------------------------------------------- 
# Install SDDM if not already installed
sudo pacman -S --noconfirm sddm
echo ""
echo " Removing lightdm "
# Disable LightDM (and its Plymouth service if present)
sudo systemctl disable lightdm
sudo systemctl disable lightdm-plymouth
echo ""
echo " Removing gdm "
echo ""
# Disable GDM (and its Plymouth service if present)
sudo systemctl disable gdm
sudo systemctl disable gdm-plymouth
echo ""
echo " Removing lxdm "
echo ""
# Disable LXDM (and its Plymouth service if present)
sudo systemctl disable lxdm
sudo systemctl disable lxdm-plymouth
echo ""
echo " Removing slim "
echo ""
# Disable SLiM (and its Plymouth service if present)
sudo systemctl disable slim
sudo systemctl disable slim-plymouth
echo ""
echo " Removing kdm "
echo ""
# Disable KDM (and its Plymouth service if present)
sudo systemctl disable kdm
sudo systemctl disable kdm-plymouth
echo ""
echo " Removing ly "
echo ""
# Disable Ly (and its Plymouth service if present)
sudo systemctl disable ly
sudo systemctl disable ly-plymouth
echo ""
echo " Enabling sddm "
echo ""
# Enable SDDM
sudo systemctl enable sddm

echo ""
# Optional: Force symlink replacement if needed (e.g., on EndeavourOS)
sudo systemctl enable sddm --force

echo ""
echo "Switched to SDDM. Reboot to apply changes."   