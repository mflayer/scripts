#!/bin/bash

echo "Installing sddm, KDE, applets, kvantum, etc."
sudo pacman -S sddm plasma kde-utils haveged xdg-user-dirs kio-gdrive p7zip kate gwenview 

echo "Enabling DM service..."
sudo systemctl enable sddm

echo "Speeding up SDDM start-up (entropy)..."
sudo systemctl enable haveged

echo "Done!" 

