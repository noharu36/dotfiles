#!/bin/bash

source "$CONFIG_DIR/var.sh"

# ワークスペースごとのアイコン定義 (Nerd Font)
# 1: ターミナル (Rio)
# 2: VSCode / Antigravity
# 3: Slack / Discord (SNS)
# 4: Obsidian (メモ)
# 5-6: その他
# 7: Arc ブラウザ
# 8: Chrome
# 9: VMware Fusion (仮想マシン)
# 10: 外部モニター
declare -A WORKSPACE_ICONS
WORKSPACE_ICONS[1]=""      # nf-dev-terminal
WORKSPACE_ICONS[2]="󰨞"     # nf-md-microsoft_visual_studio_code
WORKSPACE_ICONS[3]="󰙯"     # nf-md-discord (SNS)
WORKSPACE_ICONS[4]="󱓧"     # nf-md-notebook_edit (メモ/Obsidian)
WORKSPACE_ICONS[5]="󰮫"     # nf-md-dots_grid (その他)
WORKSPACE_ICONS[6]="󰮫"     # nf-md-dots_grid (その他)
WORKSPACE_ICONS[7]="󰇧"     # nf-md-earth (ブラウザ/Arc)
WORKSPACE_ICONS[8]=""      # nf-dev-chrome
WORKSPACE_ICONS[9]="󰍺"     # nf-md-monitor_multiple (仮想マシン)
WORKSPACE_ICONS[10]="󰍹"    # nf-md-monitor (外部モニター)

SPACES=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")

for sid in "${SPACES[@]}"; do
  ICON="${WORKSPACE_ICONS[$sid]}"
  sketchybar --add item space.$sid left
  sketchybar --subscribe space.$sid aerospace_workspace_change
  sketchybar --set space.$sid \
      label="$ICON" \
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
