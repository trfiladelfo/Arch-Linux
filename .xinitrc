#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Mpd autostart   
 [ !  -s ~/.config/mpd/pid ] && mpd

#Update Xresources 
#xrdb -merge ~/.Xresources 
[[ -f ~/.Xresources ]] && xrdb -merge "${HOME}/.Xresources"

#Iniciar o i3wm  
exec i3



