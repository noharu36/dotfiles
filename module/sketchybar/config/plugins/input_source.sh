#!/bin/bash

source "$CONFIG_DIR/colors.sh"

# 現在の入力ソースを取得してラベルを更新
update_label() {
    # AppleCurrentKeyboardLayoutInputSourceID から入力ソースを判断
    input_source=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources 2>/dev/null | grep -E "Input Mode|KeyboardLayout Name" | head -1)
    
    # 日本語入力かどうかを判断
    if echo "$input_source" | grep -qi "japanese\|hiragana\|katakana\|com.apple.inputmethod.Japanese"; then
        LABEL="あ"
        COLOR="$ORANGE"
    elif echo "$input_source" | grep -qi "roman\|ABC\|U.S.\|US\|English"; then
        LABEL="A"
        COLOR="$WHITE"
    else
        # その他の入力ソース
        LABEL="?"
        COLOR="$COLOR_INACTIVE"
    fi
    
    sketchybar --set "$NAME" label="$LABEL" label.color="$COLOR"
}

update_label