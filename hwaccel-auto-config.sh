#!/bin/bash

unset LIBVA_DRIVER_NAME VDPAU_DRIVER DRI_PRIME

if lspci -k | grep -q -e amdgpu -e radeon; then
	export LIBVA_DRIVER_NAME=radeonsi
	export VDPAU_DRIVER=radeonsi
	echo "AMD detected..."
elif lspci -k | grep -q nouveau; then
	export LIBVA_DRIVER_NAME=nouveau
	export VDPAU_DRIVER=nouveau
	echo "Nvidia detected..."
fi

if lspci -k | grep -q i915; then
	if [ -z "$LIBVA_DRIVER_NAME" ]; then
		export LIBVA_DRIVER_NAME=i965
		export VDPAU_DRIVER=va_gl
		echo "i915 detected..."
	else
		export DRI_PRIME=1
	fi
fi
