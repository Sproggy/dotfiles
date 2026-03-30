#!/usr/bin/env bash

INPUT_FILE="$HOME/.cache/wal/colors"
OUTPUT_FILE="$HOME/dotfiles/papirus-icons/scripts/folder-color.txt"
LINE_NUMBER=5 # wal colors start with a color of zero, so if i want to use color11 i must enter the value of 12 because of the row zero

# Example

#    /* Colors */         /* Row Count */
#    --color0: #242838;    1
#    --color1: #A59AAB;    2
#    --color2: #CCA0B3;    3
#    --color3: #AAC6B9;    4
#    --color4: #9CB4C7;    5
#    --color5: #D0B4C7;    6
#    --color6: #ACCFD6;    7
#    --color7: #c8c9cd;    8
#    --color8: #6a7082;    9
#    --color9: #A59AAB;    10
#    --color10: #CCA0B3;   11
#    --color11: #AAC6B9;   12
#    --color12: #9CB4C7;   13
#    --color13: #D0B4C7;   14
#    --color14: #ACCFD6;   15
#    --color15: #c8c9cd;   16

# Extract the specific line and write to output file
sed -n "${LINE_NUMBER}p" "$INPUT_FILE" > "$OUTPUT_FILE"

# color palette (color name → hex code)
declare -A colors=(
  [frappe-blue]="#8caaee"
  [frappe-flamingo]="#eebebe"
  [frappe-green]="#a6d189"
  [frappe-lavender]="#babbf1"
  [frappe-maroon]="#ea999c"
  [frappe-mauve]="#ca9ee6"
  [frappe-peach]="#ef9f76"
  [frappe-pink]="#f4b8e4"
  [frappe-red]="#e78284"
  [frappe-rosewater]="#f2d5cf"
  [frappe-sapphire]="#85c1dc"
  [frappe-sky]="#99d1db"
  [frappe-teal]="#81c8be"
  [frappe-yellow]="#e5c890"
  [latte-blue]="#1e66f5"
  [latte-flamingo]="#dd7878"
  [latte-green]="#40a02b"
  [latte-lavender]="#7287fd"
  [latte-maroon]="#e64553"
  [latte-mauve]="#8839ef"
  [latte-peach]="#fe640b"
  [latte-pink]="#ea76cb"
  [latte-red]="#d20f39"
  [latte-rosewater]="#dc8a78"
  [latte-sapphire]="#209fb5"
  [latte-sky]="#04a5e5"
  [latte-teal]="#179299"
  [latte-yellow]="#df8e1d"
  [macchiato-blue]="#8aadf4"
  [macchiato-flamingo]="#f0c6c6"
  [macchiato-green]="#a6da95"
  [macchiato-lavender]="#b7bdf8"
  [macchiato-maroon]="#ee99a0"
  [macchiato-mauve]="#c6a0f6"
  [macchiato-peach]="#f5a97f"
  [macchiato-pink]="#f5bde6"
  [macchiato-red]="#ed8796"
  [macchiato-rosewater]="f4dbd6"
  [macchiato-sapphire]="#7dc4e4"
  [macchiato-sky]="#91d7e3"
  [macchiato-teal]="#8bd5ca"
  [macchiato-yellow]="#eed49f"
  [mocha-blue]="#89b4fa"
  [mocha-flamingo]="#f2cdcd"
  [mocha-green]="#a6e3a1"
  [mocha-lavender]="#b4befe"
  [mocha-maroon]="#eba0ac"
  [mocha-mauve]="#cba6f7"
  [mocha-peach]="#fab387"
  [mocha-pink]="#f5c2e7"
  [mocha-red]="#f38ba8"
  [mocha-rosewater]="#f5e0dc"
  [mocha-sapphire]="#74c7ec"
  [mocha-sky]="#89dceb"
  [mocha-teal]="#94e2d5"
  [mocha-yellow]="#f9e2af"
)

# Read hex code from plaintext file
hex=$(<~/dotfiles/papirus-icons/scripts/folder-color.txt)

# Function to convert HEX to RGB
hex_to_rgb() {
  local hex=$1
  local r=$((16#${hex:1:2}))
  local g=$((16#${hex:3:2}))
  local b=$((16#${hex:5:2}))
  echo "$r $g $b"
}

read r1 g1 b1 <<< "$(hex_to_rgb "$hex")"

# Find the closest color
min_distance=1000000
closest_color=""

for name in "${!colors[@]}"; do
  read r2 g2 b2 <<< "$(hex_to_rgb "${colors[$name]}")"
  distance=$(( (r1 - r2) * (r1 - r2) + (g1 - g2) * (g1 - g2) + (b1 - b2) * (b1 - b2) ))
  if (( distance < min_distance )); then
    min_distance=$distance
    closest_color=$name
  fi
done

echo "Closest color to $hex is: $closest_color"
~/.local/share/icons/papirus-folders.sh -C $closest_color -t ~/.local/share/icons/Papirus-Dark

notify-send "Icon Colors updated" "with $closest_color"