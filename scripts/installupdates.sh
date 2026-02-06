#!/bin/bash
#
# ██                    ██              ██  ██
#░██                   ░██             ░██ ░██
#░██ ███████   ██████ ██████  ██████   ░██ ░██
#░██░░██░░░██ ██░░░░ ░░░██░  ░░░░░░██  ░██ ░██
#░██ ░██  ░██░░█████   ░██    ███████  ░██ ░██
#░██ ░██  ░██ ░░░░░██  ░██   ██░░░░██  ░██ ░██
#░██ ███  ░██ ██████   ░░██ ░░████████ ███ ███
#░░ ░░░   ░░ ░░░░░░     ░░   ░░░░░░░░ ░░░ ░░░
#
# ██     ██              ██             ██
#░██    ░██ ██████      ░██            ░██
#░██    ░██░██░░░██     ░██  ██████   ██████  █████   ██████
#░██    ░██░██  ░██  ██████ ░░░░░░██ ░░░██░  ██░░░██ ██░░░░
#░██    ░██░██████  ██░░░██  ███████   ░██  ░███████░░█████
#░██    ░██░██░░░  ░██  ░██ ██░░░░██   ░██  ░██░░░░  ░░░░░██
#░░███████ ░██     ░░██████░░████████  ░░██ ░░██████ ██████
# ░░░░░░░  ░░       ░░░░░░  ░░░░░░░░    ░░   ░░░░░░ ░░░░░░
#                   
# by Corrie Tilcock (2026)
# ----------------------------------------------------- 
# Required: yay trizen timeshift btrfs-grub
# ----------------------------------------------------- 

sleep 1
source ~/dotfiles/scripts/library.sh
clear

# ------------------------------------------------------
# Confirm Start
# ------------------------------------------------------

while true; do
    read -p "DO YOU WANT TO START THE UPDATE NOW? (Yy/Nn): " yn
    case $yn in
        [Yy]* )
            echo ""
        break;;
        [Nn]* ) 
            exit;
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done

if [[ $(_isInstalledYay "Timeshift") == 1 ]];
then
    while true; do
        read -p "DO YOU WANT TO CREATE A SNAPSHOT? (Yy/Nn): " yn
        case $yn in
            [Yy]* )
                echo ""
                read -p "Enter a comment for the snapshot: " c
                sudo timeshift --create --comments "$c"
                sudo timeshift --list
                sudo grub-mkconfig -o /boot/grub/grub.cfg
                echo "DONE. Snapshot $c created!"
                echo ""
            break;;
            [Nn]* ) 
            break;;
            * ) echo "Please answer yes or no.";;
        esac
    done
fi

echo "-----------------------------------------------------"
echo "Start update"
echo "-----------------------------------------------------"
echo ""

yay

notify-send "Update complete"
