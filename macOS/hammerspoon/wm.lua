hs.window.animationDuration = 0

function throwWindow(target)
	hs.window.focusedWindow():moveToUnit(target)
end

function throwLeft()
	throwWindow(
		{
			x = 0,
			y = 0,
			w = 0.5,
			h = 1
		}
	)
end

function throwRight()
	throwWindow(
		{
			x = 0.5,
			y = 0,
			w = 0.5,
			h = 1
		}
	)
end

function full()
	throwWindow(
		{
			x = 0,
			y = 0,
			w = 1,
			h = 1
		}
	)
end

function getFocusedWindowUnitRect()
	screen = window:screen()
	rect = window:frame()
	unitRect = rect:toUnitRect(screen:frame())
end

return {
	throwLeft = throwLeft,
	throwRight = throwRight,
	full = full
}
