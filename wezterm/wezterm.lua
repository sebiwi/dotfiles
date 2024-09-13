local wezterm = require("wezterm")

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
      bg_color = "#5F7C84"
    },
    inactive_tab = {
      fg_color = "#809A00",
      bg_color = "#002D3A"
    }
  }
}

config.window_background_opacity = 0.95
config.macos_window_background_blur = 10

-- mappings
config.leader = {
  key = "a",
  mods = "CTRL",
  timeout_milliseconds = 2000
}

config.keys = {
  {
    key = "[",
    mods = "LEADER",
    action = wezterm.action.ActivateCopyMode,
  },
  {
    key = "z",
    mods = "LEADER",
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = 'c',
    mods = 'LEADER',
    action = wezterm.action.SpawnTab "CurrentPaneDomain",
  },
  {
    mods = "LEADER",
    key = "p",
    action = wezterm.action.ActivateTabRelative(-1)
  },
  {
    mods = "LEADER",
    key = "n",
    action = wezterm.action.ActivateTabRelative(1)
  },
  {
    mods = "LEADER",
    key = "%",
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }
  },
  {
    mods = "LEADER",
    key = "\"",
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }
  },
  {
    mods = 'LEADER',
    key = ',',
    action = wezterm.action.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(
        function(window, pane, line)
          if line then
            window:active_tab():set_title(line)
          end
        end
      ),
    },
  },
  {
    mods = "LEADER",
    key = "h",
    action = wezterm.action.ActivatePaneDirection "Left"
  },
  {
    mods = "LEADER",
    key = "j",
    action = wezterm.action.ActivatePaneDirection "Down"
  },
  {
    mods = "LEADER",
    key = "k",
    action = wezterm.action.ActivatePaneDirection "Up"
  },
  {
    mods = "LEADER",
    key = "l",
    action = wezterm.action.ActivatePaneDirection "Right"
  },
  {
    mods = "LEADER",
    key = "LeftArrow",
    action = wezterm.action.AdjustPaneSize { "Left", 5 }
  },
  {
    mods = "LEADER",
    key = "RightArrow",
    action = wezterm.action.AdjustPaneSize { "Right", 5 }
  },
  {
    mods = "LEADER",
    key = "DownArrow",
    action = wezterm.action.AdjustPaneSize { "Down", 5 }
  },
  {
    mods = "LEADER",
    key = "UpArrow",
    action = wezterm.action.AdjustPaneSize { "Up", 5 }
  },
}

-- leader + number to activate that tab
for i = 0, 9 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = "LEADER",
        action = wezterm.action.ActivateTab(i),
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

    window:set_left_status(wezterm.format {
        { Background = { Color = "#9EABAB" } },
        { Text = prefix },
        ARROW_FOREGROUND,
        { Text = SOLID_LEFT_ARROW }
    })
end)


return config
