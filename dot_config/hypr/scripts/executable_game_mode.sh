#!/bin/bash
if grep -q 'source=~/.config/hypr/monitor_4k.conf' ~/.config/hypr/monitor.conf; then
  echo "source=~/.config/hypr/monitor_full_hd.conf" > ~/.config/hypr/monitor.conf
else 
  echo "source=~/.config/hypr/monitor_4k.conf" > ~/.config/hypr/monitor.conf
fi
