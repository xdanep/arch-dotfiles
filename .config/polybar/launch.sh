#!/bin/bash

DIR="$(dirname "$0")"

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch polybar, using default config location ~./config/polybar/config.ini

echo "---" | tee -a \
  /tmp/polybar_logo.log \
  /tmp/polybar_resources.log \
  /tmp/polybar_system.log \
  /tmp/polybar_network.log \
  /tmp/polybar_workspaces.log \
  /tmp/polybar_clock.log \
  /tmp/polybar_power.log

polybar main --config="$DIR"/bar_logo.ini 2>&1 | tee -a /tmp/polybar_logo.log &
polybar main --config="$DIR"/bar_resources.ini 2>&1 | tee -a /tmp/polybar_resources.log &
polybar main --config="$DIR"/bar_system.ini 2>&1 | tee -a /tmp/polybar_system.log &
polybar main --config="$DIR"/bar_network.ini 2>&1 | tee -a /tmp/polybar_network.log &
polybar main --config="$DIR"/bar_workspaces.ini 2>&1 | tee -a /tmp/polybar_workspaces.log &
polybar main --config="$DIR"/bar_clock.ini 2>&1 | tee -a /tmp/polybar_clock.log &
polybar main --config="$DIR"/bar_power.ini 2>&1 | tee -a /tmp/polybar_power.log &