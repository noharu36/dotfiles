#!/bin/bash

source "$CONFIG_DIR/colors.sh"

sketchybar --add item apple_logo left \
           --set apple_logo \
             icon="􀣺" \
             icon.font="SF Symbols:Bold:14" \
             icon.color="$ORANGE" \
             click_script="sketchybar --update"
