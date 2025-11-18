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

DEVICE="laptop"
case $1 in
    "desktop")
        DEVICE="desktop"
        ;;
    "laptop")
        DEVICE="laptop"
        ;;
esac

echo -e "${PINK}${GITHUB_ICON} Pulling from GitHub...${RESET}\n"
git -C $script_dir pull origin main
if [ $? -ne 0 ]; then
    echo -e "\n${RED}Error: Commit failed!${RESET}"
    exit 1
fi

# apply config
rm -r ~/Wallpapers
cp -r $script_dir/backup/Wallpapers ~/
cp -r $script_dir/backup/.config ~/
cp $script_dir/backup/bash/.bashrc ~/
cp $script_dir/backup/zsh/ ~/

# waybar device specific
case $DEVICE in
    "desktop")
        sed -i -e 's/laptop/desktop/g' ~/.config/waybar/device-specific.jsonc 
        ;;
    "laptop")
        sed -i -e 's/desktop/laptop/g' ~/.config/waybar/device-specific.jsonc 
        ;;
esac

# hyprland device specific
echo -n "" > ~/.config/hypr/device-specific.conf
echo "source = ~/.config/hypr/${DEVICE}/monitors.conf" >> ~/.config/hypr/device-specific.conf
echo "source = ~/.config/hypr/${DEVICE}/programs.conf" >> ~/.config/hypr/device-specific.conf
echo "source = ~/.config/hypr/${DEVICE}/autostart.conf" >> ~/.config/hypr/device-specific.conf
echo "source = ~/.config/hypr/${DEVICE}/bindings.conf" >> ~/.config/hypr/device-specific.conf

echo -e "\n${GREEN}${DONE_ICON} Configuration applied!${RESET}"
