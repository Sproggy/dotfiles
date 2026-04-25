a#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
MAGENTA='\033[35m'
BOLD='\033[1m'
RESET='\033[0m'

echo -e "${CYAN}"
cat << 'EOF'
 ██                                ██   ██
░██       ██   ██ ██████          ░██  ░██
░██      ░░██ ██ ░██░░░██ ██████ ██████░██  ██
░██████   ░░███  ░██  ░██░░██░░█░░░██░ ░██ ██
░██░░░██   ░██   ░██████  ░██ ░   ░██  ░████
░██  ░██   ██    ░██░░░   ░██     ░██  ░██░██  ██ ██ ██
░██  ░██  ██     ░██     ░███     ░░██ ░██░░██░██░██░██
░░   ░░  ░░      ░░      ░░░       ░░  ░░  ░░ ░░ ░░ ░░
EOF
echo -e "${RESET}"
echo -e "${MAGENTA}"
echo "
#########################################################
#                                                       #
#               Which Distro do you have?               #
#                                                       #
#########################################################

1) Arch Linux
2) EndeavourOS
3) Garuda Linux
4) Manjaro Linux
5) My Personal Dotfiles (contains testing features before being promoted to other Dots)
"
echo -e "${RESET}"
echo -e "${CYAN}"
echo "#########################   IMPORTANT   #############################
*********************************************************************
Installing my personal dots files may break your current system,
if you wish to use my personal dots i would advise on a clean install
*********************************************************************"
echo -e "${RESET}"
echo -e "${MAGENTA}"
echo " Defaults to Arch if you choose to not make selection "
echo -e "${RESET}"
echo ""
read DOTS
case $DOTS in
1)
  cd $HOME
  git clone https://github.com/hyprtk/arch-dots.git
  cd arch-dots
  sh ./1-install.sh;;
2)
  cd $HOME
  git clone https://github.com/hyprtk/endeavour-dots.git
  cd endeavour-dots
  sh ./1-install.sh;;
3)
  cd $HOME
  git clone https://github.com/hyprtk/garuda-dots.git
  cd garuda-dots
  sh ./1-install.sh;;
4)
  cd $HOME
  git clone https://github.com/hyprtk/manjaro-dots.git
  cd manjaro-dots
  sh ./1-install.sh;;
5)
  cd $HOME
  git clone https://github.com/hyprtk/my-dots.git
  cd my-dots
  sh ./1-install.sh;;
*)
  cd $HOME
  git clone https://github.com/hyprtk/arch-dots.git
  cd arch-dots
  sh ./1-install.sh;;
esac
echo ""
