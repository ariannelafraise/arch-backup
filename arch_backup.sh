#!/bin/bash

cp ~/.bashrc backup/.bashrc
cp -r ~/.config/waybar backup/waybar
cp -r ~/.config/hypr backup/hypr
cp -r ~/.config/kitty backup/kitty
cp -r ~/.config/eww backup/eww

echo "Backup completed!"
echo "Backup files are stored in the 'backup' directory."

echo "Pushing to Github..."

git add .
git commit -m "$(date +%Y-%m-%d)"
git push -u origin main

echo "Push completed!"