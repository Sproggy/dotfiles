#!/usr/bin/env bash

# --- Zenity Selection Menu ---
# We use --list to give the user a clear radio-button style choice.
CHOICE=$(zenity --list --radiolist --width=450 --height=400 \
    --title="Hyprtk Dotfiles Installer" \
    --text="Choose your distribution to install the appropriate dotfiles:" \
    --column="Select" --column="ID" --column="Distribution" \
    TRUE  "arch"      "Arch Linux" \
    FALSE "cachy"     "CachyOS" \
    FALSE "endeavour" "EndeavourOS" \
    FALSE "garuda"    "Garuda Linux" \
    FALSE "manjaro"   "Manjaro Linux" \
    FALSE "personal"  "My Personal Dotfiles (Experimental)")

# If the user hits 'Cancel' or closes the window, exit gracefully.
if [ -z "$CHOICE" ]; then
    zenity --info --text="Installation cancelled." --width=200
    exit 0
fi

# --- Warning for Personal Dots ---
if [ "$CHOICE" == "personal" ]; then
    zenity --warning --width=400 \
        --text="IMPORTANT: Installing personal dotfiles may break your current system. A clean install is advised."
    
    # Optional: Double-check confirmation for the risky choice
    zenity --question --text="Are you sure you want to proceed with Personal Dotfiles?" || exit 0
fi

# --- Mapping Choice to Repository ---
case $CHOICE in
    arch)      REPO="arch-dots" ;;
    cachy)     REPO="cachy-dots" ;;
    endeavour) REPO="endeavour-dots" ;;
    garuda)    REPO="garuda-dots" ;;
    manjaro)   REPO="manjaro-dots" ;;
    personal)  REPO="my-dots" ;;
    *)         REPO="arch-dots" ;; # Default fallback
esac

# --- Execution ---
# Using a terminal to run the actual install so the user can see progress/errors
cd "$HOME" || exit
git clone "https://github.com/hyprtk/${REPO}.git"
cd "$REPO" || exit

# Run the installer script
# Note: You might want to use 'bash' instead of 'sh' if the scripts use bashisms
sh ./1-install.sh