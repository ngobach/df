#!/usr/bin/env bash
xsetroot -cursor_name left_ptr
compton -b 
feh --bg-fill -z ~/.remastered/wallpapers
exec bspwm
# or: openbox-session
