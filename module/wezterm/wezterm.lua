local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

config.color_scheme = 'Gruvbox Dark (Gogh)'
-- config.color_scheme = 'rose-pine'
--config.color_scheme = 'Tokyo Night Storm'
--config.color_scheme = 'One Dark (Gogh)'

config.font = wezterm.font '3270 Nerd Font Mono'
config.font_size = 13

config.window_background_opacity = 0.85
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE"
config.window_close_confirmation = 'NeverPrompt'
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}
config.initial_cols = 160
config.initial_rows = 50

config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.window_frame = {
   inactive_titlebar_bg = "none",
   active_titlebar_bg = "none",
}
config.window_background_gradient = {
   colors = { "#282828" },
}

config.send_composed_key_when_left_alt_is_pressed = true
config.keys = {
    -- Command+tで新しいタブを作成
    {
        key = 't',
        mods = 'CMD',
        action = act.SpawnTab 'CurrentPaneDomain',
    },
    -- Command+wでタブを閉じる
    {
        key = 'w',
        mods = 'CMD',
        action = act.CloseCurrentTab { confirm = false },
    },
    -- Ctrl+shift+dで画面分割
    {
        key = 'd',
        mods = 'SHIFT|CTRL',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
}
return config

