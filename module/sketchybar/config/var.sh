#!/bin/bash

export PLUGIN_DIR="$CONFIG_DIR/plugins"
export ITEM_DIR="$CONFIG_DIR/items"
export PATH="$PATH:/etc/profiles/per-user/$USER/bin"
export AEROSPACE="$(which aerospace 2>/dev/null || echo "")"