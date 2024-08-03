#/bin/bash
echo ""
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
echo " Welcome to the Hyprland & QTile installer "
echo " I have chosen as my preference to install both, if you choose No on either Environments the installer will fail and close "
echo " I chose it this way so if 1 Enviroment has problems i still have the other to boot too, enjoy"
sleep 3
echo ""
echo "
#########################################################
#                                                       #
#             Starting Installation Process             #
#                                                       #
#########################################################

"
echo ""
sleep 3
echo ""
echo "
#########################################################
#                                                       #
#              Load Installation Libraries              #
#                                                       #
#########################################################

"
echo ""
source $(dirname "$0")/scripts/library.sh
echo ""
echo "
#########################################################
#                                                       #
#            Installation Libraries loaded              #
#                                                       #
#########################################################

"
echo ""
sleep 3
echo ""
echo ""
echo "
#########################################################
#                                                       #
#                     Install Yay                       #
#                                                       #
#########################################################

"
echo ""
if sudo pacman -Qs yay > /dev/null ; then
    echo "yay is installed. You can proceed with the installation"
else
    echo "yay is not installed and will be installed now!"
    _installPackagesPacman "base-devel"
    git clone https://aur.archlinux.org/yay-git.git ~/yay-git
    cd ~/yay-git
    makepkg -si
    cd ~/dotfiles/
    clear
fi
echo ""
echo ""
echo ""
echo "
#########################################################
#                                                       #
#                    Yay is Installed                   #
#                                                       #
#########################################################

"
sleep 3
echo ""
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
echo ""
sleep 3
echo ""
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
echo ""
read GRAPHICSCARD
case $GRAPHICSCARD in
1)
  sudo pacman -S --noconfirm xf86-video-intel mesa lib32-mesa lib32-vulkan-intel vulkan-intel;;
2)
  sudo pacman -S --noconfirm xf86-video-amdgpu mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau
  sudo sed -i 's/MODULES=()/MODULES=(amdgpu)/' /etc/mkinitcpio.conf
  sudo mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-custom.img;;
3)
  sudo sed -i 's/GRUB_CMDLINE_LINUX="rootfstype=ext4"/GRUB_CMDLINE_LINUX="rootfstype=ext4 nvidia_drm.modeset=1 rd.driver.blacklist=nouveau modprob.blacklist=nouveau"/' /etc/default/grub
  sudo grub-mkconfig -o /boot/grub/grub.cfg
  sudo sed -i 's/MODULES=()/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf
  echo -e "options nvidia-drm modeset=1" | sudo tee -a /etc/modprobe.d/nvidia.conf
  sudo pacman -S --noconfirm nvidia-dkms nvidia-utils nvidia-settings qt5-wayland qt5ct qt6-wayland qt6ct libva && yay --noconfirm -S libva-nvidia-driver-git
  sudo mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-custom.img;;
*)
  sudo pacman -S --noconfirm xf86-video-amdgpu mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau
  sudo sed -i 's/MODULES=()/MODULES=(amdgpu)/' /etc/mkinitcpio.conf
  sudo mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-custom.img;;
esac
echo ""
echo ""
echo ""
echo "
#########################################################
#                                                       #
#         Your Graphics Card has been installed         #
#                                                       #
#########################################################

"
sleep 3
while true; do
    read -p "DO YOU WANT TO INSTALL THE CORE APPS NOW? (Yy/Nn): " yn
    case $yn in
        [Yy]* )
            echo "Installation started."
        break;;
        [Nn]* ) 
            echo "Installation is Aborted"
            exit;
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done
echo ""
echo ""
echo ""
echo ""
echo "    ██████                                ██                             "
echo "   ██░░░░██                              ████    ██████  ██████          "
echo "  ██    ░░   ██████  ██████  █████      ██░░██  ░██░░░██░██░░░██  ██████ "
echo " ░██        ██░░░░██░░██░░█ ██░░░██    ██  ░░██ ░██  ░██░██  ░██ ██░░░░  "
echo " ░██       ░██   ░██ ░██ ░ ░███████   ██████████░██████ ░██████ ░░█████  "
echo " ░░██    ██░██   ░██ ░██   ░██░░░░   ░██░░░░░░██░██░░░  ░██░░░   ░░░░░██ "
echo "  ░░██████ ░░██████ ░███   ░░██████  ░██     ░██░██     ░██      ██████  "
echo "   ░░░░░░   ░░░░░░  ░░░     ░░░░░░   ░░      ░░ ░░      ░░      ░░░░░░   "
echo ""
echo " by Sproggy (Corrie Tilcock) (2023) "
echo " ------------------------------------------------------------------- "
echo ""
echo "
#########################################################
#                                                       #
#             Installing required Packages              #
#                                                       #
#########################################################

"
echo ""
echo "-> Install main packages"
echo ""
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
    "pamixer"
    "linux-headers"
);
echo ""
packagesYay=(
    "brave-bin" 
    "pfetch" 
    "bibata-cursor-theme" 
    "trizen"
    "sddm-theme-sugar-candy-git"
    "gnome-disk-utility"
    "thunar-shares-plugin"
    "sublime-text-4"
    "pacseek"
    "github-desktop-bin"
);
echo ""
_installPackagesPacman "${packagesPacman[@]}";
_installPackagesYay "${packagesYay[@]}";
echo ""
echo "
#########################################################
#                                                       #
#              Installed required Packages              #
#                                                       #
#########################################################

"
echo ""
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
    yay --noconfirm -S pywal-git
fi
echo ""
echo "
#########################################################
#                                                       #
#                    Pywal Installed                    #
#                                                       #
#########################################################

"
echo ""
echo "
#########################################################
#                                                       #
#                     Update .bashrc                    #
#                                                       #
#########################################################

"
echo ""
echo "-> Install .bashrc"
echo ""
_installSymLink .bashrc ~/.bashrc ~/dotfiles/.bashrc ~/.bashrc
echo ""
echo "
#########################################################
#                                                       #
#                    .bashrc Updated                    #
#                                                       #
#########################################################

"
echo ""
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
            #sh ~/dotfiles/sddm/update.sh
        break;;
        [Nn]* ) 
            echo "sddm installation skipped."
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done
echo ""
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
echo ""
echo "
#########################################################
#                                                       #
#                 Wallpapers Installed                  #
#                                                       #
#########################################################

"
echo ""
echo "
#########################################################
#                                                       #
#                     Install Fonts                     #
#                                                       #
#########################################################

"
echo ""
echo "-> Install fonts"
while true; do
    read -p "Do you want to clone the fonts? ~/fonts (Yy/Nn): " yn
    case $yn in
        [Yy]* )
            if [ -d ~/fonts/ ]; then
                echo "fonts folder does not exist."
            else
                git clone https://github.com/Sproggy/fonts.git ~/fonts
                echo "fonts installed."
            fi
            echo "fonts installed."
        break;;
        [Nn]* ) 
            if [ -d ~/fonts/ ]; then
                echo "fonts folder already exists."
            else
                mkdir ~/fonts
            fi
            sudo cp -r ~/dotfiles/fonts/* /usr/share/fonts
            sudo cp -r ~/fonts/* /usr/share/fonts
            echo "Default fonts installed."
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done
echo ""
echo "
#########################################################
#                                                       #
#                    Fonts Installed                    #
#                                                       #
#########################################################

"
echo ""
echo "
#########################################################
#                                                       #
#                   Initiating Pywal                    #
#                                                       #
#########################################################

"
echo ""
echo "-> Init pywal"
wal -i ~/dotfiles/wallpapers/default.jpg
echo "pywal initiated."
echo ""
echo ""
echo "-> Copy default wallpaper to .cache"
cp ~/dotfiles/wallpapers/default.jpg ~/.cache/current_wallpaper.jpg
sudo cp ~/.cache/current_wallpaper.jpg /root/.cache/current_wallpaper.jpg
echo "default wallpaper copied."
echo ""
echo "
#########################################################
#                                                       #
#                    Pywal Initiated                    #
#                                                       #
#########################################################

"
echo ""
sleep 3
echo ""
echo ""
echo ""
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
echo ""
while true; do
    read -p "DO YOU WANT TO START THE INSTALLATION NOW? (Yy/Nn): " yn
    case $yn in
        [Yy]* )
            echo "Installation started."
        break;;
        [Nn]* ) 
            echo "Installation is Aborted"
            exit;
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done
echo ""
echo ""
echo "
#########################################################
#                                                       #
#             Installing required Packages              #
#                                                       #
#########################################################

"
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
echo ""
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
    "p7zip-full-bin"
    "unzip"
    "unrar"
    "nwg-look-bin"
);
echo ""
echo ""
_installPackagesPacman "${packagesPacman[@]}";
_installPackagesYay "${packagesYay[@]}";
echo ""
echo ""
echo "
#########################################################
#                                                       #
#              Installed required Packages              #
#                                                       #
#########################################################

"
echo ""
sleep 3
echo ""
echo ""
echo ""
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
            echo "Installation is Aborted"
            exit;
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done
echo ""
echo ""
echo "
#########################################################
#                                                       #
#             Installing required Packages              #
#                                                       #
#########################################################

"
echo ""
echo "-> Install main packages"
echo ""
packagesPacman=(
    "qtile" 
    "polybar"
    "picom"
    "scrot"
    "slock"
);
echo ""
echo ""
_installPackagesPacman "${packagesPacman[@]}";
echo ""
echo ""
echo "
#########################################################
#                                                       #
#              Installed required Packages              #
#                                                       #
#########################################################

"
echo ""
echo "
#########################################################
#                                                       #
#            Launch Thunar to generate xfconf           #
#                                                       #
#########################################################

"
echo ""
echo "-> Launching Thunar to populate xfconf"
thunar &
sleep 3
echo ""
echo ""
echo "-> Closing Thunar"
killall thunar
echo ""
echo "
#########################################################
#                                                       #
#                   Enabling Bluetooth                  #
#                                                       #
#########################################################

"
sudo systemctl start bluetooth
sudo systemctl enable bluetooth
echo ""
echo ""
echo "
#########################################################
#                                                       #
#           IMPORTANT Graphic Card Information          #
#                                                       #
#########################################################

"
echo ""
echo ""
echo "If you installed an NVIDIA Graphics Card please follow the instructions in the"
echo "nvidia.conf file located ~/dotfiles/hypr/conf/nvidia.conf"
echo ""
echo ""
echo ""
sleep 5
echo "       ██            ██     ████ ██  ██                 "
echo "      ░██           ░██    ░██░ ░░  ░██                 "
echo "      ░██  ██████  ██████ ██████ ██ ░██  █████   ██████ "
echo "   ██████ ██░░░░██░░░██░ ░░░██░ ░██ ░██ ██░░░██ ██░░░░  "
echo "  ██░░░██░██   ░██  ░██    ░██  ░██ ░██░███████░░█████  "
echo " ░██  ░██░██   ░██  ░██    ░██  ░██ ░██░██░░░░  ░░░░░██ "
echo " ░░██████░░██████   ░░██   ░██  ░██ ███░░██████ ██████  "
echo "  ░░░░░░  ░░░░░░     ░░    ░░   ░░ ░░░  ░░░░░░ ░░░░░░   "
echo ""
echo " by Sproggy (Corrie Tilcock) (2023) "
echo " ------------------------------------------------------------------- "
echo ""
echo "The script will ask for permission to remove existing directories and files from ~/.config/"
echo "Symbolic links will then be created from ~/dotfiles into your ~/.config/ directory."
echo "But you can decide to keep your personal versions by answering with No (Nn)."
echo ""
echo ""
echo "
#########################################################
#                                                       #
#              Confirm dotfile files Install            #
#                                                       #
#########################################################

"
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
echo "
#########################################################
#                                                       #
#             Check .config directory exists            #
#                                                       #
#########################################################

"
echo ""
echo "-> Check if .config folder exists"

if [ -d ~/.config ]; then
    echo ".config folder already exists."
else
    mkdir ~/.config
    echo ".config folder created."
fi
echo ""
echo "
#########################################################
#                                                       #
#                 Create Symbolic Links                 #
#                                                       #
#########################################################

"
# name symlink source target
echo ""
echo ""
echo "-------------------------------------"
echo "-> Install general dotfiles"
echo "-------------------------------------"
echo ""
echo ""
_installSymLink alacritty ~/.config/alacritty ~/dotfiles/alacritty/ ~/.config
_installSymLink ranger ~/.config/ranger ~/dotfiles/ranger/ ~/.config
_installSymLink vim ~/.config/vim ~/dotfiles/vim/ ~/.config
_installSymLink nvim ~/.config/nvim ~/dotfiles/nvim/ ~/.config
_installSymLink starship ~/.config/starship.toml ~/dotfiles/starship/starship.toml ~/.config/starship.toml
_installSymLink rofi ~/.config/rofi ~/dotfiles/rofi/ ~/.config
_installSymLink dunst ~/.config/dunst ~/dotfiles/dunst/ ~/.config
_installSymLink wal ~/.config/wal ~/dotfiles/wal/ ~/.config
echo ""
echo "
#########################################################
#                                                       #
#                  Re-Initiating Pywal                  #
#                                                       #
#########################################################

"
echo ""
wal -i wallpapers/
echo "Pywal templates initiated!"
echo ""
echo ""
echo "
#########################################################
#                                                       #
#                    Pywal Initiated                    #
#                                                       #
#########################################################

"
echo "-------------------------------------"
echo "-> Install GTK dotfiles"
echo "-------------------------------------"
echo ""
echo ""
_installSymLink .gtkrc-2.0 ~/.gtkrc-2.0 ~/dotfiles/gtk/.gtkrc-2.0 ~/.gtkrc-2.0
_installSymLink gtk-3.0 ~/.config/gtk-3.0 ~/dotfiles/gtk/gtk-3.0/ ~/.config/
_installSymLink gtk-4.0 ~/.config/gtk-4.0 ~/dotfiles/gtk/gtk-4.0/ ~/.config/
_installSymLink themes ~/.local/share/themes ~/dotfiles/themes ~/.local/share/
echo ""
echo "-------------------------------------"
echo "-> Install Thunar dotfiles"
echo "-------------------------------------"
echo ""
echo ""
_installSymLink xfce-perchannel-xml ~/.config/xfce4/xfconf/xfce-perchannel-xml ~/dotfiles/xfce-perchannel-xml ~/.config/xfce4/xfconf/
_installSymLink Thunar ~/.config/Thunar ~/dotfiles/Thunar ~/.config/
echo ""
echo "-------------------------------------"
echo "-> Install Qtile dotfiles"
echo "-------------------------------------"
echo ""
echo ""
_installSymLink qtile ~/.config/qtile ~/dotfiles/qtile/ ~/.config
_installSymLink polybar ~/.config/polybar ~/dotfiles/polybar/ ~/.config
_installSymLink picom ~/.config/picom ~/dotfiles/picom/ ~/.config
_installSymLink .xinitrc ~/.xinitrc ~/dotfiles/qtile/.xinitrc ~/.xinitrc
echo ""
echo "-------------------------------------"
echo "-> Install Hyprland dotfiles"
echo "-------------------------------------"
echo ""
echo ""
_installSymLink hypr ~/.config/hypr ~/dotfiles/hypr/ ~/.config
_installSymLink waybar ~/.config/waybar ~/dotfiles/waybar/ ~/.config
_installSymLink swaylock ~/.config/swaylock ~/dotfiles/swaylock/ ~/.config
_installSymLink wlogout ~/.config/wlogout ~/dotfiles/wlogout/ ~/.config
_installSymLink swappy ~/.config/swappy ~/dotfiles/swappy/ ~/.config
echo ""
echo ""
echo "DONE!"
echo "NEXT: Update the keyboard layout and screen resolution in ~/dotfiles/hypr/hyprland.conf"
echo "Now proceed with rebooting your system and Enjoy!!!"
echo ""
