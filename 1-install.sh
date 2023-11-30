#/bin/bash

echo "
  ██                    ██              ██  ██
 ░██                   ░██             ░██ ░██
 ░██ ███████   ██████ ██████  ██████   ░██ ░██
 ░██░░██░░░██ ██░░░░ ░░░██░  ░░░░░░██  ░██ ░██
 ░██ ░██  ░██░░█████   ░██    ███████  ░██ ░██
 ░██ ░██  ░██ ░░░░░██  ░██   ██░░░░██  ░██ ░██
░██ ███  ░██ ██████   ░░██ ░░████████ ███ ███ 
░░ ░░░   ░░ ░░░░░░     ░░   ░░░░░░░░ ░░░ ░░░

by Sproggy (Corrie Tilcock) (2023)
#########################################################
"

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

source $(dirname "$0")/scripts/library.sh

echo " Libraries loaded "

echo "
#########################################################
#                                                       #
#             Installation Library loaded               #
#                                                       #
#########################################################

"

echo "
#########################################################
#                                                       #
#                     Install Yay                       #
#                                                       #
#########################################################

"
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

echo "
#########################################################
#                                                       #
#                    Yay is Installed                   #
#                                                       #
#########################################################

"

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
#              Installed required Packages              #
#                                                       #
#########################################################

"

echo "
#########################################################
#                                                       #
#                    Install Pywal                      #
#                                                       #
#########################################################

"
if [ -f /usr/bin/wal ]; then
    echo "pywal already installed."
else
    yay --noconfirm -S pywal
fi

echo "
#########################################################
#                                                       #
#                    Pywal Installed                    #
#                                                       #
#########################################################

"

echo "
#########################################################
#                                                       #
#                     Update .bashrc                    #
#                                                       #
#########################################################

"
echo ""
echo "-> Install .bashrc"

_installSymLink .bashrc ~/.bashrc ~/dotfiles/.bashrc ~/.bashrc

echo "
#########################################################
#                                                       #
#                    .bashrc Updated                    #
#                                                       #
#########################################################

"

echo "
#########################################################
#                                                       #
#                     Install SDDM                      #
#                                                       #
#########################################################

"
echo ""
echo "-> Install sddm display manager"
while true; do
    read -p "Do you want to install the custom login promt? (Yy/Nn): " yn
    case $yn in
        [Yy]* )
            sudo systemctl enable sddm.service
            sudo ./$HOME/dotfiles/scripts/sddm.sh
        break;;
        [Nn]* ) 
            echo "sddm installation skipped."
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "
#########################################################
#                                                       #
#                    SDDM Installed                     #
#                                                       #
#########################################################

"
echo "
#########################################################
#                                                       #
#                   Install Wallpapers                  #
#                                                       #
#########################################################

"
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

echo "
#########################################################
#                                                       #
#                 Wallpapers Installed                  #
#                                                       #
#########################################################

"
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


echo ""
echo "  ██      ██                          ██                         ██ "
echo " ░██     ░██  ██   ██ ██████         ░██                        ░██ "
echo " ░██     ░██ ░░██ ██ ░██░░░██ ██████ ░██  ██████   ███████      ░██ "
echo " ░██████████  ░░███  ░██  ░██░░██░░█ ░██ ░░░░░░██ ░░██░░░██  ██████ "
echo " ░██░░░░░░██   ░██   ░██████  ░██ ░  ░██  ███████  ░██  ░██ ██░░░██ "
echo " ░██     ░██   ██    ░██░░░   ░██    ░██ ██░░░░██  ░██  ░██░██  ░██ "
echo " ░██     ░██  ██     ░██     ░███    ███░░████████ ███  ░██░░██████ "
echo " ░░      ░░  ░░      ░░      ░░░    ░░░  ░░░░░░░░ ░░░   ░░  ░░░░░░  "
echo "  "
echo " by Sproggy (Corrie Tilcock) (2023) "
echo " ------------------------------------------------------------------- "
echo ""

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
echo ""

# ------------------------------------------------------
# Install required packages
# ------------------------------------------------------
echo ""
echo "-> Install main packages"
packagesPacman=(
    "hyprland" 
    "xdg-desktop-portal-wlr" 
    "waybar" 
    "grim" 
    "slurp"
    "swayidle"
    "swappy"
    "cliphist"
    "xorg-xhost"

);

packagesYay=(
    "swww" 
    "swaylock-effects" 
    "wlogout"
    "gvfs-afc"
    "gvfs-goa"
    "gvfs-gphoto2"
    "gvfs-mtp"
    "gvfs-nfs"
    "gvfs-smb"
    "thunar-archive-plugin"
    "thunar-custom-actions"
    "thunar-media-tags-plugin"
    "thunar-vcs-plugin"
    "thunar-volman"
    "p7zip-gui"
    "p7zip"
    "unzip"
    "unrar"
    "nwg-look"
);

# ------------------------------------------------------
# Install required packages
# ------------------------------------------------------
_installPackagesPacman "${packagesPacman[@]}";
_installPackagesYay "${packagesYay[@]}";


# ------------------------------------------------------
# Confirm Start
# ------------------------------------------------------
source $(dirname "$0")/scripts/library.sh
clear
echo "   ███████    ██████████ ██  ██          "
echo "   ██░░░░░██  ░░░░░██░░░ ░░  ░██         "
echo "  ██     ░░██     ░██     ██ ░██  █████  "
echo " ░██      ░██     ░██    ░██ ░██ ██░░░██ "
echo " ░██    ██░██     ░██    ░██ ░██░███████ "
echo " ░░██  ░░ ██      ░██    ░██ ░██░██░░░░  "
echo "  ░░███████ ██    ░██    ░██ ███░░██████ "
echo "   ░░░░░░░ ░░     ░░     ░░ ░░░  ░░░░░░  "
echo ""
echo " by Sproggy (Corrie Tilcock) (2023) "
echo " ------------------------------------------------------------------- "

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
echo ""

# ------------------------------------------------------
# Install required packages
# ------------------------------------------------------
echo ""
echo "-> Install main packages"

packagesPacman=(
    "qtile" 
    "polybar"
    "picom"
    "scrot"
    "slock"
);

# ------------------------------------------------------
# Install required packages
# ------------------------------------------------------
_installPackagesPacman "${packagesPacman[@]}";

# ------------------------------------------------------
# Launch Thunar
# ------------------------------------------------------
echo ""
echo "-> Launching Thunar to populate xfconf"
thunar &
sleep 5
# ------------------------------------------------------
# Close Thunar
# ------------------------------------------------------
echo ""
echo "-> Closing Thunar"
killall thunar

# ------------------------------------------------------
# Enable Bluetooth
# ------------------------------------------------------
sudo systemctl start bluetooth
sudo systemctl enable bluetooth
sudo grub-mkconfig -o /boot/grub/grub.cfg



echo ""
echo "DONE!"
echo "NEXT: Update the keyboard layout and screen resolution in ~/dotfiles/hypr/hyprland.conf"
echo "Then proceed with with 3-dotfiles.sh"


