local wezterm = require("wezterm")

local config = {}

config.color_scheme = "Navy and Ivory (terminal.sexy)"
-- config.color_scheme = 'Catppuccin Mocha'
-- config.color_scheme = 'Nebula (base16)'
-- config.color_scheme = 'neobones_dark'
-- config.color_scheme = 'Neon Night (Gogh)'
config.font = wezterm.font("Inconsolata")
config.font_size = 20

wezterm.on("gui-startup", function()
	local window = wezterm.mux.spawn_window({})
	window:gui_window():maximize()
end)

config.window_close_confirmation = "NeverPrompt"

config.set_environment_variables = {
  XDG_CONFIG_HOME = os.getenv("HOME") .. "/.config"
}

config.leader = { key = "Space", mods = "SHIFT", timeout_milliseconds = 1000 }

config.keys = {
	-- Pane management
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "d",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},

	-- Tab management
	{
		key = "h",
		mods = "LEADER|SHIFT",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "l",
		mods = "LEADER|SHIFT",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = "n",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "d",
		mods = "LEADER|SHIFT",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
}

return config
