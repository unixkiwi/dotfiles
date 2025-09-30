#!/usr/bin/env bash

op=$( echo -e "  Poweroff\n  Reboot\n  Logout" | wofi -i --dmenu --width 400 --height 150 | awk '{print tolower($2)}' )

case $op in 
  poweroff)
    systemctl poweroff
    ;;
  reboot)
    systemctl reboot
    ;;
  logout)
    hyprctl dispatch exit
    ;;
esac
