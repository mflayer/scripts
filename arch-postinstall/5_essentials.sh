#!/bin/bash
echo "Installing essential software..."
sudo pacman -S vlc firefox steam okular grub-customizer grub-theme-vimix qbittorrent cups cups-pdf gst-plugins-good
sudo systemctl enable org.cups.cupsd
echo "Done!"
