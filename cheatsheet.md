# Hyprland CheatSheet #

# NVIDIA Users

if you are using an NVIDIA GPU or a laptop with NVIDIA GPU,
please read the ~/dotfiles/hypr/conf/nvidia.conf for setup and configuration of your GPU

# AMDGPU Users

please install the xf86-video-amdgpu drivers and add to the modules section of your /etc/mkinicpio.conf
and run sudo mkinitcpio -P (Please ensure you have your kernels headers installed)

# Quick Keybinds

  Super = Windows Key

# common operations
  Super          Return   *term* (`alacritty`)
  Super          q        *quit* (kill focused window)
  Super          d        *show app menu* (`rofi menu`)
  Super   Ctrl   q        *show wlogout* (lock/suspend/logout/reboot/shutdown)
  Super   Shift  b        *reload waybar config files*

# screenshot
  Super PrintSrc          *full screenshot*
                          *active window screenshot*
                          *full screenshot + timer*

# screen recorder
  Super Shift PrintSrc    *to start full screen recording* (`wf-recorder`)

screen recordings are saved by default to your ~/videos/Recordings directory

# application shortcuts 
  Ctrl    Alt U           *pavucontrol*
  Ctrl    ALT P           *pamac-manager*
  Super   F               *file manager* (`thunar`)
  Super   B               *browser* (`brave`)
  Super   Ctrl B          *browser* (`chromium`)
  Super

# container layout
 
  Super   V                   *toggle tiling/floating mode*
  Super   left mouse button   *move window*
  Super   right mouse button  *resize window*

# workspaces
  Super         1 .. 0    *switch to workspace 1 .. 10*
  Super  Shift  1 .. 0    *move container to workspace 1 .. 10*

# notes
  - *Hyprland* configuration files are in `~/.config/hypr/`.
    Read all the files with the editor of your choice.
    More keybindings are included in the config.
  - *Waybar* is documented through man pages - `man waybar`. 
  - *rofi* is documented through man pages - `man rofi`.
  - *Multimedia keys* - may not work for every keyboard
    may need to hold down the function (`fn`) key
  - Follow the wiki - https://wiki.hyprland.org/
  - Follow the github - https://github.com/hyprwm/Hyprland

# user githubs
  - https://gitlab.com/Stephan-Raabe/dotfiles
  - https://github.com/JaKooLit/Hyprland-Dots
  - https://github.com/eldermf/bspwm-hyprland
  - https://github.com/lauroro/hyprland-dotfiles
  - https://github.com/eneshecan/dotfiles

# share your own files on github 
  - so we can all learn
  - and you have a backup