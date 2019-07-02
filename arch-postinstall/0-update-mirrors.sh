#!/bin/bash
command -v reflector >/dev/null 2>&1 || { echo >&2 "Reflector not found, installing..." ; sudo pacman -S --noconfirm reflector ; }
echo "Updating and optimizing mirrorlist..."
sudo reflector --latest 20 --sort rate --save /etc/pacman.d/mirrorlist >/dev/null
echo "Done!"

