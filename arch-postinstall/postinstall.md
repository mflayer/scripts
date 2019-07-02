## General stuff to do after arch install
### Speedup AUR package compiling
Uncomment/modify the line `MAKEFLAGS="-j2"` in file `/etc/makepkg.conf` where 2 is the number of cores you wish to use (1-4)

### Improve font rendering in KDE
System Settings -> Sub-pixel Rendering: `RGB` (depends on vendor)

System Settings -> Hinting: `none`

### Fix pixellated M$ fonts rendering (Cambria, Calibri):

Add to `~/.fonts.conf`:
```xml
<match target="font" >

<edit name="embeddedbitmap" mode="assign">

<bool>false</bool>

</edit>

</match>
```
Note: if it doesn't work, paste the above (as root) into `/etc/fonts/conf.d/50-user.conf`
