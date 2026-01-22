#!/bin/bash
wallpapers_dir="${HOME}/dotfiles/config/wallpapers/desktop"
for wallpaper in "${wallpapers_dir}"/*.png "${wallpapers_dir}"/*.jpg "${wallpapers_dir}"/*.svg
do
    swww img $wallpaper --transition-type none
    echo "Viewing $wallpaper"
    read
done
