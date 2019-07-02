#!/bin/bash

echo "Installing NetworkManager..."
sudo pacman -S networkmanager git
sudo systemctl enable NetworkManager

echo "Installing Xorg and drivers..."
#sudo pacman -S xorg-server xorg-drivers vulkan-radeon vulkan-icd-loader vulkan-tools libva-mesa-driver libva-utils mesa-vdpau vdpauinfo
sudo pacman -S xorg-server xorg-drivers libva-utils vdpauinfo
echo "Done!"

