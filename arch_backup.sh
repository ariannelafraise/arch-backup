#!/bin/bash

script_dir=~/personal_dev/arch-backup

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

rm -r $script_dir/backup
mkdir -p $script_dir/backup/bash
mkdir -p $script_dir/backup/zsh
mkdir -p $script_dir/backup/.config
mkdir -p $script_dir/backup/Wallpapers
cp ~/.bashrc $script_dir/backup/bash/
cp ~/.zshrc $script_dir/backup/zsh/
cp -r ~/.config/waybar $script_dir/backup/.config
cp -r ~/.config/hypr $script_dir/backup/.config
cp -r ~/.config/kitty $script_dir/backup/.config
cp -r ~/.config/eww $script_dir/backup/.config
cp -r ~/.config/wofi $script_dir/backup/.config
cp -r ~/.config/dunst $script_dir/backup/.config
cp -r ~/.config/oh-my-posh $script_dir/backup/.config
cp -r ~/.config/fastfetch $script_dir/backup/.config
cp -r ~/.config/spicetify $script_dir/backup/.config
cp -r ~/.config/swaync $script_dir/backup/.config
cp -r ~/.config/btop $script_dir/backup/.config
cp -r ~/.config/zed $script_dir/backup/.config
cp -r ~/Wallpapers $script_dir/backup/

echo -e "${GREEN}${DONE_ICON} Backup completed!${RESET}"
echo -e "${YELLOW}Backup files are stored in the '${script_dir}/backup' directory.${RESET}\n"

echo -e "${PINK}${GITHUB_ICON} Pushing to GitHub...${RESET}\n"

git -C $script_dir add -A
git -C $script_dir commit -m "$(date +"%Y-%m-%d %H:%M:%S")"
if [ $? -ne 0 ]; then
    echo -e "\n${RED}Error: Commit failed!${RESET}"
    exit 1
fi
git -C ~/personal_dev/arch-backup push -u origin main

if [ $? -ne 0 ]; then
    echo -e "\n${RED}Error: Push failed!${RESET}"
    exit 1
fi
echo -e "\n${GREEN}${DONE_ICON} Push completed!${RESET}"
