#!/bin/bash

source "$CONFIG_DIR/var.sh"

SPACES=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")

for sid in "${SPACES[@]}"; do
  sketchybar --add item space.$sid left
  sketchybar --subscribe space.$sid aerospace_workspace_change
  sketchybar --set space.$sid \
      label="$sid" \
      icon="" \
      click_script="$AEROSPACE workspace $sid" \
      script="$PLUGIN_DIR/aerospace.sh $sid" \
      padding_left=2 \
      padding_right=2 \
      label.padding_left=3 \
      label.padding_right=3 \
      background.height=20 \
      background.corner_radius=11
done
