#!/bin/bash

source "$CONFIG_DIR/var.sh"

sketchybar \
	--add item input_source right \
	--set input_source update_freq=1 \
	icon.drawing=off \
	label.font="3270 Nerd Font:Regular:13" \
	label.width=30 \
	padding_right=5 \
	script="$PLUGIN_DIR/input_source.sh"
