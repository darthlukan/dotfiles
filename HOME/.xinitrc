#!/bin/bash
# ~/.xinitrc

# Compose key on rwin. Can be disabled if compose_key.desktop
# exists in ~/.config/autostart.
setxkbmap -model pc104 -layout us -option compose:rwin

#Screensaver daemon autostartup
xscreensaver -nosplash &

# Set us up the bomb. xcompmgr stuff.
[ -f ~/.xprofile ] && . ~/.xprofile

# Engage
exec ck-launch-session dbus-launch qtile
