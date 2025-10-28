#!/usr/bin/env bash

COLORS_FILE="$HOME/Dotfiles/home/terminals/wal/colors.json"

if [[ ! -f "$COLORS_FILE" ]]; then
  echo "colors.json not found at $COLORS_FILE"
  exit 1
fi

# Read JSON with jq
FG=$(jq -r '.special.foreground' "$COLORS_FILE")
BG=$(jq -r '.special.background' "$COLORS_FILE")

# Build ANSI escape sequences for 16 colors
printf "\e]10;%s\a" "$FG"   # Foreground
printf "\e]11;%s\a" "$BG"   # Background

for i in {0..15}; do
  COLOR=$(jq -r ".colors.color${i}" "$COLORS_FILE")
  printf "\e]4;%d;%s\a" "$i" "$COLOR"
done
