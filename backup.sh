#!/bin/bash

script_dir="${HOME}/dotfiles"

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

echo -e "${PINK}${GITHUB_ICON} Pushing to GitHub...${RESET}\n"

git -C $script_dir add -A
git -C $script_dir commit -m "$(date +"%Y-%m-%d %H:%M:%S")"
if [ $? -ne 0 ]; then
    echo -e "\n${RED}Error: Commit failed!${RESET}"
    exit 1
fi
git -C "${script_dir}" push -u origin main
if [ $? -ne 0 ]; then
    echo -e "\n${RED}Error: Push failed!${RESET}"
    exit 1
fi
echo -e "\n${GREEN}${DONE_ICON} Push completed!${RESET}"
