local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 14

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.color_scheme = 'Solarized (dark) (terminal.sexy)'

config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

config.audible_bell = "Disabled"
config.native_macos_fullscreen_mode = true

return config
