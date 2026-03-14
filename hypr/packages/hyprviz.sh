#!/bin/bash
figlet -f 3d "HyprViz"
echo ""
echo " Hyprland Configuration Tool "
echo ""
cd $HOME/Downloads/yay-git/src/
git clone https://aur.archlinux.org/hyprviz-bin.git
cd hyprviz-bin
makepkg -si
echo ""