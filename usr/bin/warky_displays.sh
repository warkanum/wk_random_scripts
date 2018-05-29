#!/bin/bash

scr1name=DP-0
scr2name=DP-5


#check screen 1 on correct settings
scr1=$(xrandr | grep -c "DP-0 connected primary 2560")

#check screen 2 on correct settings
scr2=$(xrandr | grep -c "DP-5 connected 1920x1080+2560")

wall "Screen mode change detected. Executed /usr/bin/warky_displays.sh. Screen1:$scr1 Screen2:$scr2 "

if [[ $scr1 -eq 0 || $scr2 -eq 0 ]]; then
  echo Setting warky multi display mode
  xrandr --output $scr1name --mode 2560x1440 --primary --pos 0x0 --output $scr2name --mode 1920x1080 --pos 2560x0 
  #xrandr --output $scr1name --mode 2560x1440 --primary
else
  echo Display mode is good;

fi
