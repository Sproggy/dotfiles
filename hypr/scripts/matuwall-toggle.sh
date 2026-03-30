#!/bin/bash
export LD_PRELOAD=/usr/lib/libgtk4-layer-shell.so
cd ~/.local/share/Matuwall
source .venv/bin/activate

# Try toggle first
matuwall --toggle 2>/dev/null

# If daemon not running start it
if [ $? -ne 0 ]; then
    matuwall &
fi
