#!/bin/bash

source "$CONFIG_DIR/var.sh"

sketchybar \
	--add item workspace left \
	--set workspace label="?" \
	icon.drawing=off \
	padding_left=0 \
	padding_right=0 \
	label.width=20 \
	padding_right=0 \
	script="$PLUGIN_DIR/workspace.sh" \
	--subscribe workspace aerospace_workspace_change
