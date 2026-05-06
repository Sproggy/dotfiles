# Hyprland Dots

This is the configuration for Arch Linux based installations of Hyprland (Wayland) and/or XFCE (Xorg).

Supported Distro's

| Distributions|||
|----------|----------|----------|
| Arch Linux  | Archman Linux  | BlueStar Linux   |
| CachyOS   | EndeavourOS   | Garuda Linux   |
| Kiro Linux   | Manjaro Linux   | RebornOS   |

This will work on most flavours of Arch but not all Arch based Distro's are made the same. So i have custom changed the installer to each distro.

## Common Packages

- Terminal: alacritty
- Editor: nvim/ nano
- Prompt: starship
- Icons: Font Awesome
- Menus: Rofi
- Colorscheme: Pywal16 (dynamic)
- Browsers: Brave (chromium optional)
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

	Keybinding SUPER + CTRL + T or by pressing the _ icon under the picture icon in waybar.

The templates are available in ~/*-dots/waybar/themes. You can add your own personal themes into this folder. The script will read in the folder structure.

## Getting started

To make it easy for you to get started with my dotfiles, here's a list of recommended next steps.

PLEASE BACKUP YOUR EXISTING .config WITH YOUR DOTFILES BEFORE STARTING THE SCRIPTS.

# Make sure that you're in your home directory

	git clone https://raw.githubusercontent.com/hyprtk/dotfiles
	cd dotfiles
	./install.sh

#Please note that every Arch Linux system is different and I cannot guarantee that everything works fine on your system.

## Screenshots & Video

Arch Linux
![MODEL](https://github.com/hyprtk/dotfiles/blob/main/screenshots/arch1.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/arch2.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/arch3.png)

Archman Linux
![MODEL](https://github.com/hyprtk/dotfiles/blob/main/screenshots/archman1.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/archman2.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/archman3.png)

CachyOS
![MODEL](https://github.com/hyprtk/dotfiles/blob/main/screenshots/cachy1.png)
![MODEL](https://github.com/hyprtk/dotfiles/blob/main/screenshots/cachy2.png)
![MODEL](https://github.com/hyprtk/dotfiles/blob/main/screenshots/cachy3.png)

Endeavour
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/endeavour1.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/endeavour2.png)
![MODEL](https://github.com/hyprtk/dotfiles/blob/main/screenshots/endeavour3.png)

Garuda
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/garuda1.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/garuda2.png)
![MODEL](https://github.com/hyprtk/dotfiles/blob/main/screenshots/garuda3.png)

Manjaro
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/manjaro1.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/manjaro2.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/manjaro3.png)

ArcoLinux - No Longer producing Install ISO's (I am not removing the screenshots though)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/53256162013_6be4b66963_o.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/53256224204_aaa86aff2e_o.png)
