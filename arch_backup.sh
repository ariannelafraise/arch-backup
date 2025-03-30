#!/bin/bash

# Pastel colors
GREEN="\e[38;5;150m"  # Light pastel green
BLUE="\e[38;5;147m"   # Light pastel blue
PINK="\e[38;5;218m"   # Soft pink
YELLOW="\e[38;5;222m" # Light pastel yellow
RESET="\e[0m"         # Reset color

echo -e "${BLUE}Starting backup...${RESET}"

cp ~/.bashrc backup/.bashrc
cp -r ~/.config/waybar backup/waybar
cp -r ~/.config/hypr backup/hypr
cp -r ~/.config/kitty backup/kitty
cp -r ~/.config/eww backup/eww

echo -e "${GREEN}Backup completed!${RESET}"
echo -e "${YELLOW}Backup files are stored in the 'backup' directory.${RESET}\n"

echo -e "${PINK}Pushing to GitHub...${RESET}\n"

git add .
git commit -m "$(date +%Y-%m-%d)"
git push -u origin main

echo -e "\n${GREEN}Push completed!${RESET}"
