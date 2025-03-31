#!/bin/bash

# Pastel colors
GREEN="\e[38;5;150m"  # Light pastel green
BLUE="\e[38;5;147m"   # Light pastel blue
PINK="\e[38;5;218m"   # Soft pink
YELLOW="\e[38;5;222m" # Light pastel yellow
RED="\033[38;2;255;105;97m"   # Light pastel red
RESET="\e[0m"         # Reset color

# Nerd Font icons
BACKUP_ICON="󰍉 "  # Floppy disk icon (Backup)
GITHUB_ICON="󰢿 "  # GitHub icon (Push)
DONE_ICON="󰾏 "    # Checkmark icon (Completed)

echo -e "${BLUE}${BACKUP_ICON} Starting backup...${RESET}"

cp ~/.bashrc ~/personal_dev/arch-backup/backup/.bashrc
cp -r ~/.config/waybar ~/personal_dev/arch-backup/backup/waybar
cp -r ~/.config/hypr ~/personal_dev/arch-backup/backup/hypr
cp -r ~/.config/kitty ~/personal_dev/arch-backup/backup/kitty
cp -r ~/.config/eww ~/personal_dev/arch-backup/backup/eww

echo -e "${GREEN}${DONE_ICON} Backup completed!${RESET}"
echo -e "${YELLOW}Backup files are stored in the '~/personal_dev/arch-backup/backup' directory.${RESET}\n"

echo -e "${PINK}${GITHUB_ICON} Pushing to GitHub...${RESET}\n"

git -C ~/personal_dev/arch-backup add .
git -C ~/personal_dev/arch-backup commit -m "$(date +%Y-%m-%d)"
git -C ~/personal_dev/arch-backup push -u origin main

if [ $? -ne 0 ]; then
    echo -e "\n${RED}Error: Push failed!${RESET}"
    exit 1
fi
echo -e "\n${GREEN}${DONE_ICON} Push completed!${RESET}"
