#!/bin/bash

echo "Installing Keyboard led software + profiles"
yay -S g810-led
echo "Overwriting led profiles"
sudo cp -rfv ./g810-led.d/* /etc/g810-led
