#!/bin/bash

echo "Setting up awww wrapper..."

mkdir -p "$HOME/.local/bin"
cat > "$HOME/.local/bin/awww" << 'AWWWEOF'
#!/bin/bash
# MASU awww wrapper — runs real awww then triggers pywal pipeline
REAL_AWW=/usr/bin/awww
WALLPAPER="${@: -1}"
"$REAL_AWW" "$@"
[ -f "$WALLPAPER" ] && bash ~/.config/hypr/scripts/wallpaper-colors.sh "$WALLPAPER" &
AWWWEOF
chmod +x "$HOME/.local/bin/awww"

# Add ~/.local/bin to PATH if not already there
if ! grep -q 'local/bin' ~/.zshrc 2>/dev/null; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
fi
if ! grep -q 'local/bin' ~/.bashrc 2>/dev/null; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
fi

# Add pywal terminal color restore
if ! grep -q 'wal/sequences' ~/.zshrc 2>/dev/null; then
    echo '(cat ~/.cache/wal/sequences &)' >> ~/.zshrc
fi

sudo ln -s /usr/bin/awww /usr/bin/swww
sudo ln -s /usr/bin/awww-daemon /usr/bin/swww-daemon

echo "awww wrapper installed!"