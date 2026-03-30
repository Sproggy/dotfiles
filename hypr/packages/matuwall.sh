#!/bin/bash
figlet -f 3d "Matuwall"
echo ""
sleep 2
echo " Matuwall Installer "
echo ""    
echo "Installing Matuwall wallpaper picker..."
echo ""    
git clone https://github.com/naurissteins/Matuwall.git ~/.local/share/Matuwall
cd ~/.local/share/Matuwall
/usr/bin/python -m venv --system-site-packages .venv
source .venv/bin/activate
pip install --upgrade pip
pip install .
mkdir -p ~/.local/bin
ln -sf "$PWD/.venv/bin/matuwall" ~/.local/bin/matuwall
cd -
echo " Matuwall installed! "
sleep 2
