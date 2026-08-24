local wezterm = require("wezterm")
local config = wezterm.config_builder()

--- plugins
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
local wez_tmux = wezterm.plugin.require("https://github.com/sei40kr/wez-tmux")

--- general
config.audible_bell = "Disabled"
config.native_macos_fullscreen_mode = true

-- Don't override SSH_AUTH_SOCK with wezterm's own agent proxy: its symlink
-- goes stale after a wezterm restart/update, breaking ssh-add in old shells.
-- Panes inherit the macOS launchd agent instead.
config.mux_enable_ssh_agent = false

--- fonts
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14

-- tab bar
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.switch_to_last_active_tab_when_closing_tab = true

-- colors
config.color_scheme = "Solarized (dark) (terminal.sexy)"
-- config.color_scheme = "Tokyo Night Storm"

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
tabline.setup({
	options = {
		theme = "Solarized (dark) (terminal.sexy)",
		-- Make the active tab clearly stand out, like the selected buffer in the
		-- nvim bufferline. The default solarized tab colors are base02 (active)
		-- vs base03 (inactive) -- nearly identical near-blacks -- so the active
		-- tab gets a solid accent and inactive tabs are dimmed.
		theme_overrides = {
			tab = {
				active = { fg = "#002b36", bg = "#268bd2" }, -- solarized blue (dark text)
				inactive = { fg = "#586e75", bg = "#002b36" }, -- dimmed base01 on the bar
				inactive_hover = { fg = "#93a1a1", bg = "#073642" },
			},
		},
	},
	sections = {
		tabline_b = {},
		tabline_c = {},
		-- Inactive tabs: index + current directory only. (Default was the
		-- foreground process, which fell back to the pane title / remote domain
		-- -- the unclear "IP-address" text.)
		tab_inactive = {
			"index",
			{ "cwd", padding = { left = 0, right = 1 } },
		},
		tabline_x = {},
		tabline_y = {},
		tabline_z = {},
	},
})
tabline.apply_to_config(config)

-- wez-tmux config
wez_tmux.apply_to_config(config)

table.insert(config.keys, {
	key = "S",
	mods = "LEADER|SHIFT",
	action = wezterm.action.PaneSelect({ mode = "SwapWithActive" }),
})

-- LEADER r: toggle split orientation between horizontal and vertical.
-- Only handles the two-pane case: with more panes the target position is
-- ambiguous, so it does nothing.
table.insert(config.keys, {
	key = "r",
	mods = "LEADER",
	action = wezterm.action_callback(function(window, pane)
		local panes = pane:tab():panes_with_info()
		if #panes ~= 2 then
			return
		end
		local other = panes[1].pane:pane_id() == pane:pane_id() and panes[2] or panes[1]
		-- same top offset means side by side, so restack; otherwise unstack
		local flag = (panes[1].top == panes[2].top) and "--bottom" or "--right"
		-- absolute path: the GUI process PATH doesn't include the wezterm CLI
		wezterm.run_child_process({
			wezterm.executable_dir .. "/wezterm",
			"cli",
			"split-pane",
			flag,
			"--pane-id",
			tostring(pane:pane_id()),
			"--move-pane-id",
			tostring(other.pane:pane_id()),
		})
	end),
})

-- flash.nvim-style scrollback navigation
local act = wezterm.action

-- LEADER f: label every token on screen, press a letter to jump-select + copy
table.insert(config.keys, {
	key = "f",
	mods = "LEADER",
	action = act.QuickSelectArgs({
		label = "jump",
		patterns = {
			"[^[:space:]]{3,}", -- any run of 3+ non-space chars
		},
	}),
})

-- Send a plain Escape on CTRL+[ so it works under the Kitty keyboard
-- protocol (e.g. Claude Code), where CTRL+[ is otherwise disambiguated from Esc
table.insert(config.keys, {
	key = "[",
	mods = "CTRL",
	action = act.SendKey({ key = "Escape" }),
})

-- CTRL+[ steps out one level at a time in copy/search mode: if a visual
-- selection is active, clear just the selection and stay in copy mode;
-- otherwise close copy mode entirely. These modes use their own key tables,
-- so the global CTRL+[ binding above doesn't reach them.
local copy_mode = (config.key_tables and config.key_tables.copy_mode) or wezterm.gui.default_key_tables().copy_mode
local search_mode = (config.key_tables and config.key_tables.search_mode)
	or wezterm.gui.default_key_tables().search_mode

local function ctrl_bracket_copy_mode(window, pane)
	if window:get_selection_text_for_pane(pane) ~= "" then
		window:perform_action(act.Multiple({ act.ClearSelection, act.CopyMode("ClearSelectionMode") }), pane)
	else
		window:perform_action(act.CopyMode("Close"), pane)
	end
end

table.insert(copy_mode, {
	key = "[",
	mods = "CTRL",
	action = wezterm.action_callback(ctrl_bracket_copy_mode),
})
table.insert(search_mode, {
	key = "[",
	mods = "CTRL",
	action = wezterm.action_callback(ctrl_bracket_copy_mode),
})

config.key_tables = config.key_tables or {}
config.key_tables.copy_mode = copy_mode
config.key_tables.search_mode = search_mode

return config
