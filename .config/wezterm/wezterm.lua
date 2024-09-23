local wezterm = require("wezterm")

-- Create WezTerm configuration
local config = wezterm.config_builder()
config.enable_wayland = true
config.enable_tab_bar = false
config.window_decorations = "NONE"
config.window_close_confirmation = "NeverPrompt"

config.default_cursor_style = "BlinkingBar"

-- Use the Tokyo Night color scheme
config.color_scheme = "Tokyo Night"

config.font = wezterm.font("FiraCode")
config.font_size = 10.0

return config
