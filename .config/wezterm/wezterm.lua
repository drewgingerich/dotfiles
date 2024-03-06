local wezterm = require 'wezterm'

local config = {}

config.color_scheme = 'Navy and Ivory (terminal.sexy)'
-- config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font 'Inconsolata'
config.font_size = 20

wezterm.on("gui-startup", function()
  local tab, pane, window = wezterm.mux.spawn_window{}
  window:gui_window():maximize()
end)

config.window_close_confirmation = 'NeverPrompt'

config.leader = { key = 'Space', mods = 'SHIFT', timeout_milliseconds = 1000 }
config.keys = {
  {
    key = 'h',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Left'  
  },
  {
    key = 'j',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Down'  
  },
  {
    key = 'k',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Up'  
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Right'  
  },
  { key = 'h',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.ActivateTabRelative(-1)
  },
  { key = 'l',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.ActivateTabRelative(1)
  }
}

return config
