#!/bin/bash
figlet -f 3d "Sys Tools"
echo " Hyprland Configuration Tool "
cd $HOME/Downloads/yay-git/src/
git clone https://aur.archlinux.org/hyprviz-bin.git
cd hyprviz-bin
makepkg -si