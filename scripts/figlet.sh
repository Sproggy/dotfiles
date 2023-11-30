#!/bin/bash
#
#  ████████ ██          ██           ██   
# ░██░░░░░ ░░   █████  ░██          ░██   
# ░██       ██ ██░░░██ ░██  █████  ██████ 
# ░███████ ░██░██  ░██ ░██ ██░░░██░░░██░  
# ░██░░░░  ░██░░██████ ░██░███████  ░██   
# ░██      ░██ ░░░░░██ ░██░██░░░░   ░██   
# ░██      ░██  █████  ███░░██████  ░░██  
# ░░       ░░  ░░░░░  ░░░  ░░░░░░    ░░   
#  
# by Sproggy (Corrie Tilcock) (2023) 
# ------------------------------------------------------------------- 
# Script to create ascii font based header on user input
# and copy the result to the clipboard
# -------------------------------------------------------------------

read -p "Enter the text for ascii encoding: " mytext
figlet -f 3d "$mytext" > ~/figlet.txt
echo "" >> ~/figlet.txt
echo "by Sproggy (Corrie Tilcock) (2023)" >> ~/figlet.txt
echo "-------------------------------------------------------------------" >> ~/figlet.txt
sed -i 's/^/# /; s/$/ /' ~/figlet.txt
lines=$( cat ~/figlet.txt )
wl-copy "$lines"
xclip -sel clip ~/figlet.txt

echo "Text copied to clipboard!"
