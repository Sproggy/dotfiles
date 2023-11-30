#/bin/bash

echo "yay has been installed successfully."
echo ""
echo "  ██                    ██              ██  ██ "
echo " ░██                   ░██             ░██ ░██ "
echo " ░██ ███████   ██████ ██████  ██████   ░██ ░██ "
echo " ░██░░██░░░██ ██░░░░ ░░░██░  ░░░░░░██  ░██ ░██ "
echo " ░██ ░██  ░██░░█████   ░██    ███████  ░██ ░██ "
echo " ░██ ░██  ░██ ░░░░░██  ░██   ██░░░░██  ░██ ░██ "
echo " ░██ ███  ░██ ██████   ░░██ ░░████████ ███ ███ "
echo " ░░ ░░░   ░░ ░░░░░░     ░░   ░░░░░░░░ ░░░ ░░░  "
echo ""
echo " by Sproggy (Corrie Tilcock) (2023) "
echo " ------------------------------------------------------------------- "
echo ""

echo "
#########################################################
#                                                       #
#             Starting Installation Process             #
#                                                       #
#########################################################

"

echo "
#########################################################
#                                                       #
#               Load Installation Library               #
#                                                       #
#########################################################

"
# ------------------------------------------------------
# Load Library
# ------------------------------------------------------
source $(dirname "$0")/scripts/library.sh
clear

echo "
#########################################################
#                                                       #
#             Installation Library loaded               #
#                                                       #
#########################################################

"
# ------------------------------------------------------
# Check if yay is installed
# ------------------------------------------------------
if sudo pacman -Qs yay > /dev/null ; then
    echo "yay is installed. You can proceed with the installation"
else
    echo "yay is not installed. Will be installed now!"
    _installPackagesPacman "base-devel"
    git clone https://aur.archlinux.org/yay-git.git ~/yay-git
    cd ~/yay-git
    makepkg -si
    cd ~/dotfiles/
    clear
fi


# ------------------------------------------------------
# Confirm Start
# ------------------------------------------------------

while true; do
    read -p "DO YOU WANT TO START THE INSTALLATION NOW? (Yy/Nn): " yn
    case $yn in
        [Yy]* )
            echo "Installation started."
        break;;
        [Nn]* ) 
            exit;
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done


echo "
#########################################################
#                                                       #
#            Which Graphics Card do you have?           #
#                                                       #
#########################################################

1) Intel
2) AMD
3) Nvidia
Defaults to AMD if you choose
something else

"

read GRAPHICSCARD
case $GRAPHICSCARD in
1)
  sudo pacman -S --noconfirm xf86-video-intel mesa lib32-mesa lib32-vulkan-intel vulkan-intel;;
2)
  sudo pacman -S --noconfirm xf86-video-amdgpu mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau;;
3)
  sudo pacman -S --noconfirm nvidia-dkms nvidia-utils nvidia-settings;;
*)
  sudo pacman -S --noconfirm xf86-video-amdgpu mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau;;
esac

echo "
#########################################################
#                                                       #
#         Your Graphics Card has been installed         #
#                                                       #
#########################################################

"

clear

echo "
#########################################################
#                                                       #
#             Installing required Packages              #
#                                                       #
#########################################################

"
# ------------------------------------------------------
# Install required packages
# ------------------------------------------------------
echo ""
echo "-> Install main packages"

packagesPacman=(
    "pacman-contrib"
    "alacritty"
    "kitty" 
    "rofi" 
    "chromium" 
    "nitrogen" 
    "dunst" 
    "starship"
    "ranger"
    "neovim" 
    "mpv" 
    "freerdp" 
    "xfce4-power-manager" 
    "thunar" 
    "mousepad" 
    "awesome-terminal-fonts" 
    "ttf-font-awesome" 
    "ttf-fira-sans" 
    "ttf-fira-code" 
    "ttf-firacode-nerd"
    "figlet" 
    "vlc" 
    "exa" 
    "python-pip" 
    "python-psutil" 
    "python-rich" 
    "python-click" 
    "xdg-desktop-portal-gtk"
    "pavucontrol" 
    "tumbler" 
    "xautolock" 
    "blueman"
    "sddm"
    "papirus-icon-theme"
    "btop"
    "networkmanager"
    "network-manager-applet"
    "git"
    "nano"
    "xdg-user-dirs"
    "xdg-user-dirs-gtk"
    "os-prober"
    "polkit-gnome"
    "gnome-keyring"
    "gvfs"
    "ntfs-3g"
    "samba"
    "xfce4-terminal"
    "wf-recorder"
    "file-roller"
    "micro"
    "xclip"
);

packagesYay=(
    "brave-bin" 
    "pfetch" 
    "bibata-cursor-theme" 
    "trizen"
    "sddm-sugar-candy-git"
    "gnome-disk-utility"
    "thunar-shares-plugin"
    "sublime-text-4"
    "pamac-gtk"
);
  
_installPackagesPacman "${packagesPacman[@]}";
_installPackagesYay "${packagesYay[@]}";

echo "
#########################################################
#                                                       #
#             Installed required Packages               #
#                                                       #
#########################################################

"

# ------------------------------------------------------
# Install pywal
# ------------------------------------------------------
if [ -f /usr/bin/wal ]; then
    echo "pywal already installed."
else
    yay --noconfirm -S pywal
fi

clear

# ------------------------------------------------------
# Install .bashrc
# ------------------------------------------------------
echo ""
echo "-> Install .bashrc"

_installSymLink .bashrc ~/.bashrc ~/dotfiles/.bashrc ~/.bashrc

# ------------------------------------------------------
# Install sddm display manager
# ------------------------------------------------------
echo ""
echo "-> Install sddm display manager"
while true; do
    read -p "Do you want to install the custom login promt? (Yy/Nn): " yn
    case $yn in
        [Yy]* )
            sudo systemctl enable sddm.service
        break;;
        [Nn]* ) 
            echo "sddm installation skipped."
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# ------------------------------------------------------
# Install wallpapers
# ------------------------------------------------------
echo ""
echo "-> Install wallapers"
while true; do
    read -p "Do you want to clone the wallpapers? If not, the script will install 3 default wallpapers to ~/wallpaper/ (Yy/Nn): " yn
    case $yn in
        [Yy]* )
            if [ -d ~/wallpaper/ ]; then
                echo "wallpaper folder already exists."
            else
                git clone https://github.com/Sproggy/wallpaper.git ~/wallpaper
                echo "wallpaper installed."
            fi
            echo "Wallpaper installed."
        break;;
        [Nn]* ) 
            if [ -d ~/wallpaper/ ]; then
                echo "wallpaper folder already exists."
            else
                mkdir ~/wallpaper
            fi
            cp ~/dotfiles/wallpapers/* ~/wallpaper
            echo "Default wallpapers installed."
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# ------------------------------------------------------
# Init pywal
# ------------------------------------------------------
echo ""
echo "-> Init pywal"
wal -i ~/dotfiles/wallpapers/default.jpg
echo "pywal initiated."

# ------------------------------------------------------
# Copy default wallpaper to .cache
# ------------------------------------------------------
echo ""
echo "-> Copy default wallpaper to .cache"
cp ~/dotfiles/wallpapers/default.jpg ~/.cache/current_wallpaper.jpg
echo "default wallpaper copied."

# ------------------------------------------------------
# DONE
# ------------------------------------------------------
clear
echo "DONE!" 
echo "NEXT: Please continue with 2-install-hyprland.sh and/or 2-install-qtile.sh"
