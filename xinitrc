#!/usr/bin/env bash
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
xsetroot -cursor_name left_ptr
compton -b 
feh --bg-fill -z ~/Pictures/Wallpapers
ibus-daemon -rd
exec bspwm
# or: openbox-session
