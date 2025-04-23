#!/bin/bash

# Kill any existing polybar instance
killall -q polybar

# Wait for it to shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
/usr/bin/polybar example &
