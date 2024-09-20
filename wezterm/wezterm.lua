local wezterm = require("wezterm")
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
local act = wezterm.action

local config = wezterm.config_builder()

--- general
config.audible_bell = "Disabled"
config.native_macos_fullscreen_mode = true

config.window_decorations = "RESIZE"

--- fonts
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 14

-- tab bar
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true
config.tab_max_width = 32
config.switch_to_last_active_tab_when_closing_tab = true

-- colors
config.color_scheme = "Solarized (dark) (terminal.sexy)"
config.colors = {
	tab_bar = {
		background = "#002b36",
		active_tab = {
			fg_color = "#FFF6E1",
			bg_color = "#5F7C84",
		},
		inactive_tab = {
			fg_color = "#809A00",
			bg_color = "#002D3A",
		},
	},
}

config.window_background_opacity = 0.95
config.macos_window_background_blur = 10

-- mappings
config.leader = {
	key = "a",
	mods = "CTRL",
	timeout_milliseconds = 2000,
}

config.keys = {
	{
		mods = "LEADER",
		key = "[",
		action = act.ActivateCopyMode,
	},
	{
		mods = "LEADER",
		key = "z",
		action = act.TogglePaneZoomState,
	},
	{
		mods = "LEADER",
		key = "c",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "LEADER",
		key = "p",
		action = act.ActivateTabRelative(-1),
	},
	{
		mods = "LEADER",
		key = "n",
		action = act.ActivateTabRelative(1),
	},
	{
		mods = "LEADER",
		key = "%",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = '"',
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = ",",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{
		mods = "LEADER",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "LEADER",
		key = "j",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "k",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		mods = "LEADER",
		key = "l",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		mods = "LEADER",
		key = "LeftArrow",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		mods = "LEADER",
		key = "RightArrow",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	{
		mods = "LEADER",
		key = "DownArrow",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		mods = "LEADER",
		key = "UpArrow",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
}

config.key_tables = {
	copy_mode = {
		{ key = "q", mods = "NONE", action = act.CopyMode("Close") },

		{ key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
		{ key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
		{ key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
		{ key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },

		{ key = "w", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
		{ key = "e", mods = "NONE", action = act.CopyMode("MoveForwardWordEnd") },

		{ key = "b", mods = "NONE", action = act.CopyMode("MoveBackwardWord") },

		{ key = "0", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
		{ key = "$", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") },
		{ key = "_", mods = "NONE", action = act.CopyMode("MoveToStartOfLineContent") },

		{ key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
		{ key = "V", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Line" }) },
		{ key = "v", mods = "CTRL", action = act.CopyMode({ SetSelectionMode = "Block" }) },

		{ key = "G", mods = "NONE", action = act.CopyMode("MoveToScrollbackBottom") },
		{ key = "g", mods = "NONE", action = act.CopyMode("MoveToScrollbackTop") },

		{ key = "H", mods = "NONE", action = act.CopyMode("MoveToViewportTop") },
		{ key = "M", mods = "NONE", action = act.CopyMode("MoveToViewportMiddle") },
		{ key = "L", mods = "NONE", action = act.CopyMode("MoveToViewportBottom") },

		{ key = "u", mods = "CTRL", action = act.CopyMode("PageUp") },
		{ key = "d", mods = "CTRL", action = act.CopyMode("PageDown") },

		-- Enter y to copy and quit the copy mode.
		{
			key = "y",
			mods = "NONE",
			action = act.Multiple({
				act.CopyTo("ClipboardAndPrimarySelection"),
				act.CopyMode("Close"),
			}),
		},
		-- Enter search mode to edit the pattern.
		-- When the search pattern is an empty string the existing pattern is preserved
		{ key = "/", mods = "NONE", action = act({ Search = { CaseSensitiveString = "" } }) },
		{ key = "?", mods = "NONE", action = act({ Search = { CaseInSensitiveString = "" } }) },
		{ key = "n", mods = "CTRL", action = act({ CopyMode = "NextMatch" }) },
		{ key = "p", mods = "CTRL", action = act({ CopyMode = "PriorMatch" }) },
	},

	search_mode = {
		{ key = "Escape", mods = "NONE", action = act({ CopyMode = "Close" }) },
		-- Go back to copy mode when pressing enter, so that we can use unmodified keys like "n"
		-- to navigate search results without conflicting with typing into the search area.
		{ key = "Enter", mods = "NONE", action = "ActivateCopyMode" },
		{ key = "c", mods = "CTRL", action = "ActivateCopyMode" },
		{ key = "n", mods = "CTRL", action = act({ CopyMode = "NextMatch" }) },
		{ key = "p", mods = "CTRL", action = act({ CopyMode = "PriorMatch" }) },
		{ key = "r", mods = "CTRL", action = act.CopyMode("CycleMatchType") },
		{ key = "u", mods = "CTRL", action = act.CopyMode("ClearPattern") },
	},
}

-- leader + number to activate that tab
for i = 0, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i),
	})
end

-- status
wezterm.on("update-right-status", function(window, _)
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#5F7C84" } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x1f30a) -- ocean wave
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	if window:active_tab():tab_id() ~= 0 then
		ARROW_FOREGROUND = { Foreground = { Color = "#002D3A" } }
	end -- arrow color based on if tab is first pane

	window:set_left_status(wezterm.format({
		{ Background = { Color = "#9EABAB" } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
	}))
end)

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

return config
