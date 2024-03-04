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

return config
