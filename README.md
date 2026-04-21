# Hyprland Dots

This is the configuration for Arch Linux, Arcolinux, Garuda, Manjaro based installations of Hyprland (Wayland) and/or XFCE (Xorg).

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

Hyprland: Included is a pywal16 configuration that changes the color scheme based on a randomly selected wallpaper. 

	Keybinding SuperKey + Shift + w you can change the wallpaper.

	Keybinding SuperKey + Ctrl + w opens rofi with a list of installed wallpapers.

	Keybinding SuperKey + w opens matuwall to display all wallpapers on a film roll (Editable)

See also the .zshrc and the key bindings on Hyprland and XFCE for more alias definitions.

Hyprland: In addition, you can switch the Waybar Template

	Keybinding SUPER + CTRL + T or by pressing the _ icon under the picture icon in waybat.

The templates are available in ~/dotfiles/waybar/themes. You can add your own personal themes into this folder. The script will read in the folder structure.

## Screenshots & Video

Arch Linux
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/screenshot-2026-04-21_13-02-05.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/screenshot-2026-04-21_13-04-49.png)

Garuda
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/screenshot-2026-04-13_10-37-05.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/screenshot-2026-04-13_10-42-20.png)

Manjaro
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/screenshot-2026-04-21_15-01-38.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/screenshot-2026-04-21_15-00-19.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/screenshot-2026-04-21_15-01-24.png)

ArcoLinux - No Longer producing Install ISO's (I am not removing the screenshots though)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/53256162013_6be4b66963_o.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/53256224204_aaa86aff2e_o.png)


## Getting started

To make it easy for you to get started with my dotfiles, here's a list of recommended next steps.

PLEASE BACKUP YOUR EXISTING .config WITH YOUR DOTFILES BEFORE STARTING THE SCRIPTS.

```
# Make sure that you're in your home directory

git clone https://raw.githubusercontent.com/hyprtk/dotfiles
cd dotfiles
./install.sh

#Please note that every Arch Linux system is different and I cannot guarantee that everything works fine on your system.

