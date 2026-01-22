#!/bin/bash

mkdir -p "$HOME/.config"

rm -rf "$HOME/.config/btop" && ln -sf "$HOME/dotfiles/config/btop" "$HOME/.config/btop"
rm -rf "$HOME/.config/dunst" && ln -sf "$HOME/dotfiles/config/dunst" "$HOME/.config/dunst"
rm -rf "$HOME/.config/eww" && ln -sf "$HOME/dotfiles/config/eww" "$HOME/.config/eww"
rm -rf "$HOME/.config/fastfetch" && ln -sf "$HOME/dotfiles/config/fastfetch" "$HOME/.config/fastfetch"
rm -rf "$HOME/.config/hypr" && ln -sf "$HOME/dotfiles/config/hypr" "$HOME/.config/hypr"
rm -rf "$HOME/.config/kitty" && ln -sf "$HOME/dotfiles/config/kitty" "$HOME/.config/kitty"
rm -rf "$HOME/.config/oh-my-posh" && ln -sf "$HOME/dotfiles/config/oh-my-posh" "$HOME/.config/oh-my-posh"
rm -rf "$HOME/.config/spicetify" && ln -sf "$HOME/dotfiles/config/spicetify" "$HOME/.config/spicetify"
rm -rf "$HOME/.config/swaync" && ln -sf "$HOME/dotfiles/config/swaync" "$HOME/.config/swaync"
rm -rf "$HOME/.config/waybar" && ln -sf "$HOME/dotfiles/config/waybar" "$HOME/.config/waybar"
rm -rf "$HOME/.config/wofi" && ln -sf "$HOME/dotfiles/config/wofi" "$HOME/.config/wofi"
rm -rf "$HOME/.config/zed" && ln -sf "$HOME/dotfiles/config/zed" "$HOME/.config/zed"
rm -f "$HOME/.bashrc" && ln -sf "$HOME/dotfiles/config/bash/.bashrc" "$HOME/.bashrc"
rm -f "$HOME/.zshrc" && ln -sf "$HOME/dotfiles/config/zsh/.zshrc" "$HOME/.zshrc"
rm -rf "$HOME/wallpapers" && ln -sf "$HOME/dotfiles/config/wallpapers" "$HOME/wallpapers"
