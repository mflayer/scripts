#!/bin/bash
sudo pacman -S dosfstools exfat-utils ntfs-3g amd-ucode
sudo grub-mkconfig -o /boot/grub/grub.cfg
