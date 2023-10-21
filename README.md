# My Hyprland Dotfiles

This is my fork of Stephan Raabe's dotfiles for Hyprland, His version is a rounded effect across the whole landscape of Hyprland and associated applications. I have gone for a more squared look an feel.

His original work can be found here

https://gitlab.com/stephan-raabe/dotfiles.git

I have not personally used or played with QTile config, so this is an as is copy of Stephan's config and any questions please reach out to him.

# Hyprland dotfiles

This is the configuration for Arcolinux based installation of Hyprland (Wayland) and/or Qtile (Xorg).

This will work on most flavours of Arch.


## Common Packages

- Terminal: alacritty
- Editor: nvim/ nano
- Prompt: starship
- Icons: Font Awesome
- Menus: Rofi
- Colorscheme: pywal (dynamic)
- Browsers: chromium (brave optional)
- Filemanager: Thunar
- Cursor: Bibata Modern Ice
- Icons: Papirus-Icon-Theme
- Virtual Machine: qemu (Windows 11 with looking glass and xrdp)

## Hyprland

- Status Bar: waybar
- Screenshots: grim & slurp
- Clipboard Manager: cliphist
- Logout: wlogout
- Screenlock: swaylock-effects
- Screen Capture - wf-recorder

## Qtile

- Compositor: picom
- Status Bar: polybar
- Screenshots: scrot

## Templating

Hyprland & Qtile: Included is a pywal configuration that changes the color scheme based on a randomly selected wallpaper. With the key binding SuperKey + Shift + w you can change the wallpaper. SuperKey + Ctrl + w opens rofi with a list of installed wallpapers for your individual selection. See also the .bashrc and the key bindings on Hyprland and Qtile for more alias definitions.

Hyprland: In addition, you can switch the Waybar Template with SUPER + CTRL + T or by pressing the "..." icon in Waybar. The templates are available in ~/dotfiles/waybar/themes. You can add your own personal themes into this folder. The script will read in the folder structure.

## Screenshots & Video

<img> src="screenshots/screenshot-20231020-194152.png"</img>

<img> src="screenshots/screenshot-20231020-194408.png"</img>

<img> src="screenshots/screenshot-20231020-194623.png""</img>

<img> src="screenshots/screenshot-20231020-194651.png"</img>

## Getting started

To make it easy for you to get started with my dotfiles, here's a list of recommended next steps.

PLEASE BACKUP YOUR EXISTING .config WITH YOUR DOTFILES BEFORE STARTING THE SCRIPTS.

```
# Make sure that you're in your home directory
cd

# Clone the repository from your home directory
git clone https://github.com/Sproggy/dotfiles.git

# Or download the lastest version and unzip into ~/dotfiles folder

# Change into the new dotfiles folder
cd dotfiles

# Install all required packages
./1-install.sh

# Install hyprland window manager
./2-install-hyprland.sh
# OR/AND Install qtile window manager
./2-install-qtile.sh

# Install dotfiles
./3-install-dotfiles.sh

```
Please note that every Arch Linux system is different and I cannot guarantee that everything works fine on your system.

