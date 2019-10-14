local module = {}

function module.makeExtensible(mode)
	mode.isExtensible = true
	mode.enterFns = {}
	mode.exitFns = {}

	function mode:enter()
		mode.__index.enter(self)
		for fn in pairs(self.enterFns) do
			fn(self)
		end
	end

	function mode:exit()
		mode.__index.exit(self)
		for fn in pairs(self.exitFns) do
			fn(self)
		end
	end

	function mode:addEnterFn(fn)
		self.enterFns[fn] = true
	end

	function mode:addExitFn(fn)
		self.exitFns[fn] = true
	end
end

function module.ensureIsExtensible(mode)
	if mode.isExtensible ~= true then
		module.makeExtensible(mode)
	end
end



module.activeModes = {}

function module.makeExclusive(mode, layer)

	function setActiveMode(mode)
		if module.activeModes[layer] ~= nil then
			module.activeModes[layer]:exit()
		end
		module.activeModes[layer] = mode
	end
	
	function clearActiveMode()
		module.activeModes.layer = nil
	end

	module.ensureIsExtensible(mode)
	mode:addEnterFn(setActiveMode)
	mode:addExitFn(clearActiveMode)
end



function module.makeTransient(mode, mods, key)
	mode.enterEventtap = hs.eventtap.new(
		{ hs.eventtap.event.types.keyDown },
		function(event)
			if event:getKeyCode() ~= hs.keycodes.map[key] then
				return false
			end

			heldMods = hs.eventtap.checkKeyboardModifiers()
			match = hs.fnutils.every(
				mods,
				function(mod)
					return heldMods[mod] ~= nil
				end
			)
			logger.log(match)
			if match ~= true then
				return false
			end

			mode:enter()
		end
	)

	mode.exitEventtap = hs.eventtap.new(
		{ hs.eventtap.event.types.keyUp },
		function(event)
			if event:getKeyCode() == hs.keycodes.map[key] then
				mode:exit()
			end
		end
	)

	function onEnter()
		mode.enterEventtap:stop()
		mode.exitEventtap:start()
	end

	function onExit()
		mode.exitEventtap:stop()
		mode.enterEventtap:start()
	end

	module.ensureIsExtensible(mode)
	mode:addEnterFn(onEnter)
	mode:addExitFn(onExit)
	mode.enterEventtap:start()
end



function module.addGrayScreen(mode)
	function setGray(_)
		hs.screen.setForceToGray(true)
	end

	function unsetGray(_)
		hs.screen.setForceToGray(false)
	end

	module.ensureIsExtensible(mode)
	mode:addEnterFn(setGray)
	mode:addExitFn(unsetGray)
end

function module.addGreyScreen(mode)
	module.addGrayScreen(mode)
end



return module
