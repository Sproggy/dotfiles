# Hyprland garuda-dots

This is the configuration for Arch Linux, Arcolinux, Manjaro based installations of Hyprland (Wayland) and/or XFCE (Xorg).

This will work on most flavours of Arch.


## Common Packages

- Terminal: alacritty
- Editor: nvim/ nano
- Prompt: starship
- Icons: Font Awesome
- Menus: Rofi
- Colorscheme: pywal16 (dynamic)
- Browsers: chromium (brave optional)
- Filemanager: Thunar
- Cursor: Bibata Modern Ice
- Icons: Papirus-Icon-Theme
- Virtual Machine: qemu/kvm, vmware workstation, winboat

## Hyprland

- Status Bar: waybar
- Screenshots: grim & slurp
- Clipboard Manager: cliphist
- Logout: hyprlogout
- Screenlock: swaylock-effects
- Screen Capture: wf-recorder

## Templating

Hyprland: Included is a pywal16 configuration that changes the color scheme based on a randomly selected wallpaper. With the key binding SuperKey + Shift + w you can change the wallpaper. SuperKey + Ctrl + w opens rofi with a list of installed wallpapers for your individual selection. See also the .bashrc and the key bindings on Hyprland and Qtile for more alias definitions.

Hyprland: In addition, you can switch the Waybar Template with SUPER + CTRL + T or by pressing the "..." icon in Waybar. The templates are available in ~/garuda-dots/waybar/themes. You can add your own personal themes into this folder. The script will read in the folder structure.

## Screenshots & Video

Garuda
![Model](https://github.com/hyprtk/garuda-dots/blob/main/screenshots/screenshot-2026-04-13_10-37-05.png)
![Model](https://github.com/hyprtk/garuda-dots/blob/main/screenshots/screenshot-2026-04-13_10-42-20.png)

Manjaro
![Model](https://github.com/hyprtk/garuda-dots/blob/main/screenshots/screenshot-20231020-194152.png)
![Model](https://github.com/hyprtk/garuda-dots/blob/main/screenshots/screenshot-20231020-194408.png)
![Model](https://github.com/hyprtk/garuda-dots/blob/main/screenshots/screenshot-20231020-194623.png)
![Model](https://github.com/hyprtk/garuda-dots/blob/main/screenshots/screenshot-20231020-194651.png)

ArcoLinux
![Model](https://github.com/hyprtk/garuda-dots/blob/main/screenshots/53256162013_6be4b66963_o.png)
![Model](https://github.com/hyprtk/garuda-dots/blob/main/screenshots/53256224204_aaa86aff2e_o.png)
![Model](https://github.com/hyprtk/garuda-dots/blob/main/screenshots/53256357675_f6af5c7757_o.png)

Arch Linux
![Model](https://github.com/hyprtk/garuda-dots/blob/main/screenshots/screenshot-20231021-163804.png)
![Model](https://github.com/hyprtk/garuda-dots/blob/main/screenshots/screenshot-20231021-163834.png)
![Model](https://github.com/hyprtk/garuda-dots/blob/main/screenshots/screenshot-20231021-164005.png)


## Getting started

To make it easy for you to get started with my garuda-dots, here's a list of recommended next steps.

PLEASE BACKUP YOUR EXISTING .config WITH YOUR DOTFILES BEFORE STARTING THE SCRIPTS.

```
# Make sure that you're in your home directory
cd

# Clone the repository to your home directory
git clone https://github.com/hyprtk/garuda-dots.git

# Or download the lastest version and unzip into ~/garuda-dots folder

# Change into the new garuda-dots folder
cd garuda-dots

# Just run the single install file and go through every step, please be aware that this installs both Hyprland (Wayland) and XFCE (Xorg) environments at once
./1-install.sh

```
Please note that every Arch Linux system is different and I cannot guarantee that everything works fine on your system.

