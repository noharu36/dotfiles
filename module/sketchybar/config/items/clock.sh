#!/bin/bash

source "$CONFIG_DIR/var.sh"

sketchybar \
	--add item clock right \
	--set clock update_freq=5 \
	icon.drawing=off \
	script="$PLUGIN_DIR/clock.sh"
