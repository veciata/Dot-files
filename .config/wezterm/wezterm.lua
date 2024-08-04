local wezterm = require("wezterm")

-- Function to read CSS variables from a file
local function read_css_colors(file)
	local colors = {}
	for line in io.lines(file) do
		local name, value = line:match("@define%-color%s+(%w+)%s+(#[%w]+);")
		if name and value then
			colors[name] = value
		end
	end
	return colors
end

-- Load the colors from the CSS file
local css_file = os.getenv("HOME") .. "/.config/waybar/theme/tokyonight.css"
local colors = read_css_colors(css_file)

-- Create WezTerm configuration
local config = wezterm.config_builder()
config.enable_wayland = false
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"

config.default_cursor_style = "BlinkingBar"

config.colors = {
	foreground = colors.color4, -- text color
	background = colors.color1, -- bg color
	cursor_bg = colors.color4, -- text color
	cursor_border = colors.color4, -- text color
	cursor_fg = colors.color1, -- bg color
	selection_bg = colors.color3, -- item hover bg color
	selection_fg = colors.color4, -- text color

	ansi = {
		colors.color1, -- black
		colors.color2, -- red
		colors.color5, -- green
		colors.color4, -- yellow
		colors.color5, -- blue
		colors.color6, -- magenta
		colors.color3, -- cyan
		colors.color4, -- white
	},
	brights = {
		colors.color3, -- bright black
		colors.color4, -- bright red
		colors.color5, -- bright green
		colors.color6, -- bright yellow
		colors.color2, -- bright blue
		colors.color1, -- bright magenta
		colors.color4, -- bright cyan
		colors.color6, -- bright white
	},
}

config.font_size = 12.0
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

return config
