#!/bin/bash

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/var.sh"

LOG_FILE="/tmp/sketchybar_aerospace.log"

SID="$1"
if [ -n "$FOCUSED_WORKSPACE" ]; then
  FOCUSED="$FOCUSED_WORKSPACE"
else
  FOCUSED=$("$AEROSPACE" list-workspaces --focused 2>/dev/null || echo "1")
fi

echo "Item ID (\$SID): [$SID] = Env Var (FOCUSED): [$FOCUSED]" >> "$LOG_FILE"

if [ "$SID" = "$FOCUSED" ]; then
  sketchybar --set $NAME \
    background.drawing=on \
    background.color=$COLOR_ACCENT
else
  sketchybar --set $NAME \
    background.drawing=off \
    label.color=$COLOR_INACTIVE
fi
