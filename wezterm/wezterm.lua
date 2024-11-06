local wezterm = require("wezterm")
local config = wezterm.config_builder()

--- plugins
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
local wez_tmux = wezterm.plugin.require("https://github.com/sei40kr/wez-tmux")

--- general
config.audible_bell = "Disabled"
config.native_macos_fullscreen_mode = true

--- fonts
config.font_size = 14

-- tab bar
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.switch_to_last_active_tab_when_closing_tab = true

-- colors
config.color_scheme = "Solarized (dark) (terminal.sexy)"

config.window_background_opacity = 0.95
config.macos_window_background_blur = 10

-- mappings
config.leader = {
	key = "b",
	mods = "CTRL",
}

-- smart splits config
smart_splits.apply_to_config(config, {
	direction_keys = {
		move = { "h", "j", "k", "l" },
		resize = { "LeftArrow", "DownArrow", "UpArrow", "RightArrow" },
	},
	-- modifier keys to combine with direction_keys
	modifiers = {
		move = "CTRL", -- modifier to use for pane movement, e.g. CTRL+h to move left
		resize = "META", -- modifier to use for pane resize, e.g. META+h to resize to the left
	},
})

-- tabline config
tabline.get_config()
tabline.setup({
	options = {
		theme = "Solarized (dark) (terminal.sexy)",
	},
	sections = {
		tabline_b = {},
		tabline_c = {},
		tabline_x = {},
		tabline_y = {},
		tabline_z = {},
	},
})
tabline.apply_to_config(config)

-- wez-tmux config
wez_tmux.apply_to_config(config)

return config
