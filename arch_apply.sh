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

echo -e "${PINK}${GITHUB_ICON} Pulling from GitHub...${RESET}\n"
git -C $script_dir pull origin main
if [ $? -ne 0 ]; then
    echo -e "\n${RED}Error: Commit failed!${RESET}"
    exit 1
fi

cp -r $script_dir/backup/.config ~/
cp $script_dir/backup/bash/.bashrc ~/.bashrc

echo -e "\n${GREEN}${DONE_ICON} Configuration applied!${RESET}"
