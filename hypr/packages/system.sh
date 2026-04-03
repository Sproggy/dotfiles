#/bin/bash
figlet -f 3d "System"
echo ""
echo " System Packages "
echo ""
sudo pacman -S sddm blueman pacman-contrib fzf font-manager awesome-terminal-fonts ttf-font-awesome ttf-fira-sans ttf-fira-code ttf-firacode-nerd exa python-pip python-psutil python-rich python-click xdg-desktop-portal-gtk xdg-user-dirs xdg-user-dirs-gtk os-prober polkit-gnome gnome-keyring pcp pcp-gui gtk4-layer-shell hyprpicker --noconfirm
sudo pacman -S $(pacman -Ssq 'pcp-pmda-*') --noconfirm
echo ""
yay -S bibata-cursor-theme waypaper trizen sublime-text-4 sddm-theme-sugar-candy-git pacseek pamac-all libpamac-full pamac-cli --noconfirm
echo ""
figlet -f 3d "Papyrus Folders Install"
wget -qO- https://git.io/papirus-folders-install | env PREFIX=$HOME/.local sh
echo ""