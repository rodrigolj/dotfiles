#! /bin/bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar dvi -c /home/$USER/.config/polybar/config.ini &

if [[ $(xrandr -q | grep 'HDMI-0 connected') ]]; then
  polybar hdmi -c /home/$USER/.config/polybar/config.ini &
fi

if [[ $(xrandr -q | grep 'DP-0 connected') ]]; then
  polybar dp -c /home/$USER/.config/polybar/config.ini &
fi


# screens=$(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f6)
#
# if [[ $(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f4 | cut -d"+" -f2- | uniq | wc -l) == 1 ]]; then
#   MONITOR=$(polybar --list-monitors | cut -d":" -f1) TRAY_POS=right polybar dp &
# else
#   primary=$(xrandr --query | grep primary | cut -d" " -f1)
#
#   for m in $screens; do
#     if [[ $primary == $m ]]; then
#         MONITOR=$m polybar dp &
#     else
#         MONITOR=$m polybar dvi &
#     fi
#   done
# fi
