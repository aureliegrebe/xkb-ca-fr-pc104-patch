# xkb-ca-fr-pc104-patch

Patches to add guillemet and degree symbols to the Canadian French keyboard
layout that are accessible on a pc104 layout. 

## Requirements

These patches are for X11 keyboard files. I have only tested this script on
an Arch installation running X11, so some modification may be necessary if
the layouts are stored in different places on your system.

## installation

1. Run `install.sh` as superuser.
2. Reload keyboard layout: `setxkbmap -layout ca -variant fr`


## Symbol mapping
| Symbol | Keystroke |
|--------|-----------|
| '«'    | AltGr + Z |
| '»'    | AltGr + X |
| '°'    | AltGr + D |
