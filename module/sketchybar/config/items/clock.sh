#!/bin/bash

sketchybar \
	--add item clock right \
	--set clock update_freq=5 \
	icon.drawing=off \
	script="$PLUGIN_DIR/clock.sh"
