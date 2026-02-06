#/bin/bash
figlet -f 3d "System"
echo " System Packages "
sudo pacman -S sddm blueman papirus-icon-theme pacman-contrib awesome-terminal-fonts ttf-font-awesome ttf-fira-sans ttf-fira-code ttf-firacode-nerd exa python-pip python-psutil python-rich python-click xdg-desktop-portal-gtk xdg-user-dirs xdg-user-dirs-gtk os-prober polkit-gnome gnome-keyring gnome-system-monitor --noconfirm
echo ""
yay -S bibata-cursor-theme trizen waypaper sublime-text-4 sddm-theme-sugar-candy-git pacseek xautolock --noconfirm
echo ""