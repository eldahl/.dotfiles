#!/bin/sh

# Install script for applications and tools assuming base Arch Linux
# system with packages: base linux linux-firmware neovim amd-ucode efibootmgr grub
sudo pacman --needed -S alsa-firmware alsa-utils arandr bitwarden clang cmake ninja discord dmenu dolphin fastfetch feh firefox font-manager git github-cli gnome-keyring htop i3-wm i3status kitty less noto-fonts-emoji nvidia nerd-fonts pasystray picom pipewire pipewire-alsa pipewire-pulse polkit-kde-agent sof-firmware starship sudo thunderbird ufw which xorg xorg-xinit
sudo pacman --needed -S rawtherapee gimp obsidian gvfs gphoto2 xdg-desktop-portal syncthing spectacle raw-thumbnailer kdesdk-thumbnailers kdegraphics-thumbnailers i3lock gwenview xclip freecad

# Install yay for AUR packages
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si

# Install AUR packages
yay -S curseforge minecraft-launcher spotify-launcher nomachine zsa-keymapp-bin zoom qt6-imageformats eddie-ui-git

### Dolphin default programs for file extension support ###
# Taken from Arch Linux support forum: https://bbs.archlinux.org/viewtopic.php?id=293509
# 1. Remove kservice5 package and its dependencies (optional)
sudo pacman -Rsn kservice5

# 2. Download plasma-workspace package and extract the archive
#    URL: https://archlinux.org/packages/extra/x86_64/plasma-workspace/download/
mkdir ~/temp
cd ~/temp/
wget https://archlinux.org/packages/extra/x86_64/plasma-workspace/download/
tar --use-compress-program=unzstd -xvf plasma-workspace*

# 3. Make directory for menus
sudo mkdir -p /etc/xdg/menus

# 4. Copy the relevant files/dirs from the plasma-workspace archive:
sudo cp -a etc/xdg/menus/plasma-applications.menu /etc/xdg/menus
sudo cp -ar usr/share/desktop-directories /usr/share

# 5. Run to build menus
XDG_MENU_PREFIX=plasma- kbuildsycoca6

# Clean up
rm -rf ~/temp
cd ~
### Dolphin default programs END ###

### Dark/Light mode toggle with xdg portal ###
# Reddit post detailing getting darkman to plug and play: 
# https://www.reddit.com/r/archlinux/comments/17bkz58/comment/kh51tnc/
mkdir -p ~/.config/xdg-desktop-portal/
echo '[preferred]
default=gtk
org.freedesktop.impl.portal.Settings=darkman' > ~/.config/xdg-desktop-portal/portals.conf

mkdir -p ~/.config/systemd/user/xdg-desktop-portal.service.d/
echo '[Service]
Environment="XDG_CURRENT_DESKTOP=KDE"' > ~/.config/systemd/user/xdg-desktop-portal.service.d/override.conf
### Dark/Light mode toggle with xdg portal END ###
