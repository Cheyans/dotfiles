-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.colors = {
    scrollbar_thumb = '#c4c1bd',
}
config.color_scheme = 'Solarized (dark) (terminal.sexy)'
config.window_background_opacity = 0.9
config.macos_window_background_blur = 15

-- Random settings
config.scrollback_lines = 50000
config.enable_scroll_bar = true

-- Keybindings
config.keys = {
  -- Split pane vertically
  {
    key = 'd',
    mods = 'SUPER',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- Split pane horizontally 
  {
    key = 'd',
    mods = 'SUPER|SHIFT',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- Close pane
  {
    key = 'w',
    mods = 'SUPER',
    action = act.CloseCurrentPane { confirm = true }, 
  },
  {
    key = 'LeftArrow',
    mods = 'SUPER|SHIFT',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'SUPER|SHIFT',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'SUPER|SHIFT',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'SUPER|SHIFT',
    action = act.ActivatePaneDirection 'Down',
  },
  -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
  {
    key="LeftArrow", 
    mods="OPT", 
    action=wezterm.action{SendString="\x1bb"}
  },
  -- Make Option-Right equivalent to Alt-f; forward-word
  {
    key="RightArrow", 
    mods="OPT", 
    action=wezterm.action{SendString="\x1bf"}
  },
}

-- and finally, return the configuration to wezterm
return config
