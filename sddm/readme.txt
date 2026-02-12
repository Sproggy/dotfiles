# CURRENTLY WORK IN PROGRESS TO CREATE A SDDM THEME

# Install sugar dark as a base
yay -S sddm-Sugar-Candy

# In the [Theme] section simply add the themes name: Current=Sugar-Candy
# Copy from /usr/lib/sddm/sddm.conf.d/default.conf
/etc/sddm.conf.d/sddm.conf

# Test the theme
sddm-greeter --test-mode --theme /usr/share/sddm/themes/Sugar-Candy