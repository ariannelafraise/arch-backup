#!/bin/bash
script_dir="${HOME}/dotfiles/config/wallpapers/scripts"
randomWallpaper=$(ls "${script_dir}/../desktop/"*.png "${script_dir}/../desktop/"*.jpg "${script_dir}/../desktop/"*.svg | sort -R | tail -1)
touch "${script_dir}/lastwallpaper"

while [ "$randomWallpaper" = $(cat $script_dir/lastwallpaper) ]
do
    randomWallpaper=$(ls "${script_dir}/../desktop/"*.png "${script_dir}/../desktop/"*.jpg "${script_dir}/../desktop/"*.svg | sort -R | tail -1)
done

echo -n "$randomWallpaper" > $script_dir/lastwallpaper

if [ "$1" = "startup" ]
then
    randomArchWallpaper=$(ls "${script_dir}/../arch/"*.png "${script_dir}/../arch/"*.jpg "${script_dir}/../arch/"*.svg | sort -R | tail -1)
    swww img $randomArchWallpaper --transition-type none && sleep 0.2 && swww img $randomWallpaper --transition-type outer --transition-fps 200 --transition-duration 3
else
    swww img $randomWallpaper --transition-type wipe --transition-fps 255 --transition-duration 1.5
fi
