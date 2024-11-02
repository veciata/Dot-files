local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

config.keys = {
	-- paste from the clipboard
	{ key = "V", mods = "CTRL", action = act.PasteFrom("Clipboard") },

	-- paste from the primary selection
	{ key = "V", mods = "CTRL", action = act.PasteFrom("PrimarySelection") },
}
-- Create WezTerm configuration
-- config.enable_wayland = false
config.enable_tab_bar = false
config.window_decorations = "NONE"
config.window_close_confirmation = "NeverPrompt"

config.default_cursor_style = "BlinkingBar"

-- Use the Tokyo Night color scheme
config.color_scheme = "Tokyo Night"

config.font = wezterm.font("Fira Code")
config.font_size = 10.0
config.window_background_opacity = 0.9

return config
