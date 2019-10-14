local c = require("common")
local wm = require("wm")
local hsConfigWatcher = require("hsConfigWatcher")
local mhe = require("modalHotkeyExtensions")

windowMode = hs.hotkey.modal.new()
mhe.addGrayScreen(windowMode)
mhe.makeTransient(windowMode, c.hyper, "w")
windowMode:bind(
	"",
	"j",
	function()
		wm.throwLeft()
	end
)
windowMode:bind(
	"",
	"l",
	function()
		wm.throwRight()
	end
)
windowMode:bind(
	"",
	"k",
	function ()
		wm.full()
	end
)