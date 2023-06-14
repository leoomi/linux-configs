#!/usr/bin/env bash

polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
MONITOR=HDMI-0 POLYTRAY="right" polybar mybar 2>&1 | tee -a /tmp/polybar1.log & disown
MONITOR=DP-5 POLYTRAY=" " polybar mybar 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
