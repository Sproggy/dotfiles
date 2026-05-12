# Hyprland Dots

This is the configuration for Arch Linux based installations of Hyprland (Wayland) and/or XFCE (Xorg).

<table align="center">
  <tr>
    <th>Supported Distributions</th>
    <th>Thumbnails</th>
  </tr>
  <tr>
    <td><a href="https://github.com/hyprtk/arch-dots">Arch Linux</a></td>
    <td><img src="https://github.com/hyprtk/dotfiles/blob/main/thumbnails/arch1-thumb.png" width="350"></td>
  </tr>
  <tr>
    <td><a href="https://github.com/hyprtk/archcraft-dots">Archcraft Linux</a></td>
    <td><img src="https://github.com/hyprtk/dotfiles/blob/main/thumbnails/archcraft1-thumb.png" width="350"></td>
  </tr>
  <tr>
    <td><a href="https://github.com/hyprtk/archman-dots">Archman Linux</a></td>
    <td><img src="https://github.com/hyprtk/dotfiles/blob/main/thumbnails/archman1-thumb.png" width="350"></td>
  </tr>
  <tr>
    <td><a href="https://github.com/hyprtk/bslx-dots">BlueStar Linux</a></td>
    <td><img src="https://github.com/hyprtk/dotfiles/blob/main/thumbnails/bslx1-thumb.png" width="350"></td>
  </tr>
  <tr>
    <td><a href="https://github.com/hyprtk/cachy-dots">CachyOS</a></td>
    <td><img src="https://github.com/hyprtk/dotfiles/blob/main/thumbnails/cachy1-thumb.png" width="350"></td>
  </tr>
  <tr>
    <td><a href="https://github.com/hyprtk/endeavour-dots">EndeavurOS</a></td>
    <td><img src="https://github.com/hyprtk/dotfiles/blob/main/thumbnails/endeavour1-thumb.png" width="350"></td>
  </tr>
  <tr>
    <td><a href="https://github.com/hyprtk/garuda-dots">Garuda Linux</a></td>
    <td><img src="https://github.com/hyprtk/dotfiles/blob/main/thumbnails/garuda1-thumb.png" width="350"></td>
  </tr>
  <tr>
    <td><a href="https://github.com/hyprtk/kiro-dots">Kiro Linux</a> (ArcoLinux Project)</td>
    <td><img src="https://github.com/hyprtk/dotfiles/blob/main/thumbnails/kiro1-thumb.png" width="350"></td>
  </tr>
  <tr>
    <td><a href="https://github.com/hyprtk/manjaro-dots">Manjaro Linux</a></td>
    <td><img src="https://github.com/hyprtk/dotfiles/blob/main/thumbnails/manjaro1-thumb.png" width="350"></td>
  </tr>
  <tr>
    <td><a href="https://github.com/hyprtk/reborn-dots">RebornOS</a></td>
    <td><img src="https://github.com/hyprtk/dotfiles/blob/main/thumbnails/reborn1-thumb.png" width="350"></td>
  </tr>
</table>   

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

Archcraft Linux
![MODEL](https://github.com/hyprtk/dotfiles/blob/main/screenshots/archcraft1.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/archcraft2.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/archcraft3.png)

Archman Linux
![MODEL](https://github.com/hyprtk/dotfiles/blob/main/screenshots/archman1.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/archman2.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/archman3.png)

BlueStar Linux
![MODEL](https://github.com/hyprtk/dotfiles/blob/main/screenshots/bslx1.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/bslx2.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/bslx3.png)

CachyOS
![MODEL](https://github.com/hyprtk/dotfiles/blob/main/screenshots/cachy1.png)
![MODEL](https://github.com/hyprtk/dotfiles/blob/main/screenshots/cachy2.png)
![MODEL](https://github.com/hyprtk/dotfiles/blob/main/screenshots/cachy3.png)

EndeavourOS
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/endeavour1.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/endeavour2.png)
![MODEL](https://github.com/hyprtk/dotfiles/blob/main/screenshots/endeavour3.png)

Garuda Linux
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/garuda1.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/garuda2.png)
![MODEL](https://github.com/hyprtk/dotfiles/blob/main/screenshots/garuda3.png)

Kiro Linux
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/kiro1.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/kiro2.png)
![MODEL](https://github.com/hyprtk/dotfiles/blob/main/screenshots/kiro3.png)

Manjaro Linux
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/manjaro1.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/manjaro2.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/manjaro3.png)

RebornOS
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/reborn1.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/reborn2.png)
![Model](https://github.com/hyprtk/dotfiles/blob/main/screenshots/reborn3.png)
