#!/bin/sh
# Install script for applications and tools assuming base Arch Linux 
# system with packages: base linux linux-firmware neovim amd-ucode efibootmgr grub
sudo pacman --needed -S alsa-firmware alsa-utils arandr bitwarden clang discord dmenu dolphin fastfetch feh firefox font-manager git github-cli gnome-keyring htop i3-wm i3status kitty less noto-fonts-emoji nvidia nerd-fonts pasystray picom pipewire pipewire-alsa pipewire-pulse polkit-kde-agent sof-firmware starship sudo thunderbird ufw which xorg xorg-xinit
sudo pacman --needed -S rawtherapee gimp obsidian gvfs gphoto2

# Install yay for AUR packages
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si

# Install AUR packages
yay -S curseforge minecraft-launcher spotify-launcher nomachine
