local wezterm = require 'wezterm'
local act = wezterm.action
local setting = {}
setting.color_scheme = 'rose-pine'
--setting.color_scheme = 'Tokyo Night Storm'
--setting.color_scheme = 'One Dark (Gogh)'
setting.window_background_opacity = 0.85
setting.window_close_confirmation = 'NeverPrompt'
setting.initial_cols = 180
setting.initial_rows = 50
setting.send_composed_key_when_left_alt_is_pressed = true
setting.keys = {
    -- Ctrl+shift+tで新しいタブを作成
    {
        key = 't',
        mods = 'SHIFT|CTRL',
        action = act.SpawnTab 'CurrentPaneDomain',
    },
    -- Ctrl+shift+dで画面分割
    {
        key = 'd',
        mods = 'SHIFT|CTRL',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
}
return setting

