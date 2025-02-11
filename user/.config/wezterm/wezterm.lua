local wezterm = require 'wezterm'
local config = {}
local keys = {
	{
		key = 'F1',
		mods = 'CTRL',
		action = wezterm.action.ActivateCommandPalette
	},
	{
		key = 'y',
		mods = 'CTRL',
		action = wezterm.action.QuickSelect
	},
	{
		key = 's',
		mods = 'CTRL',
		action = wezterm.action.QuickSelectArgs {
			patterns = {
				'https?://.+?(?=[ \\\\"\'])',
			}
		}
	},
	{
		key = ' ',
		mods = 'SHIFT|CTRL',
		action = wezterm.action.DisableDefaultAssignment
	},
	{
		key = 'k',
		mods = 'SHIFT|CTRL',
		action = wezterm.action.DisableDefaultAssignment
	},
}
local colors = {
	foreground = "d3d3d3",
	background = "220022",

	ansi = {
		"#000000",
		"#cd0000",
		"#00e000",
		"#cdcd00",
		"#7f7fff",
		"#cd00cd",
		"#00cdcd",
		"#e5e5e5",
	},
	brights = {
		"#7f7f7f",
		"#ff0000",
		"#00cd00",
		"#ffff00",
		"#5c5cff",
		"#ff00ff",
		"#00ffff",
		"#ffffff",
	},
}
local font = wezterm.font_with_fallback {
	{
		family = 'FiraCode Nerd Font',
		weight = "Regular",
	},
	"Noto Color Emoji",
	"Noto Sans CJK SC",
}
config.colors = colors
config.use_ime = true
config.enable_tab_bar = false
config.keys = keys
config.quick_select_alphabet = "qwertz"
config.font = font
config.font_size = 14
config.window_padding = {
	left = 4,
	right = 4,
	top = 4,
	bottom = 4,
}

config.webgpu_preferred_adapter = {
	backend = "Vulkan",
	device = 7298,
	device_type = "DiscreteGpu",
	driver = "NVIDIA",
	driver_info = "565.77",
	name = "NVIDIA GeForce GTX 1050 Ti",
	vendor = 4318,
}
config.front_end = 'WebGpu'

return config
