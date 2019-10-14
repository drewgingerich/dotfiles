-- OOP structure from https://www.oreilly.com/library/view/creating-solid-apis/9781491986301/ch04.html
Set = {}

function Set:new(obj)
	set = {}
	set.items = obj or {}
	self.__index = self
	setmetatable(obj, self)
	return obj
end

function Set:add(item)
	if not self.items.item then
		self.items.insert(item)
	end
end

function Set:remove(item)
	if self.items.item then
		self.items.remove(item)
	end
end

return Set

