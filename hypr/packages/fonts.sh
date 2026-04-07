#/bin/bash
figlet -f 3d "Fonts"
echo ""
echo ""
echo "-> Install fonts"
while true; do
    read -p "Do you want to clone the fonts? ~/fonts (Yy/Nn): " yn
    case $yn in
        [Yy]* )
            if [ -d ~/.local/share/fonts/ ]; then
                echo "fonts folder does not exist."
            else
                git clone https://github.com/hyprtk/fonts.git ~/.local/share/fonts
                echo "user fonts installed."
            fi
            echo "User Fonts Installed."
        break;;
        [Nn]* ) 
            if [ -d ~/.local/share/fonts/ ]; then
                echo "fonts folder already exists."
            else
                mkdir ~/.local/share/fonts
            fi
            sudo cp -r ~/dotfiles/fonts/* /usr/share/fonts
            sudo cp -r ~/.local/share/fonts/* /usr/share/fonts
            echo "System Fonts Installed."
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done