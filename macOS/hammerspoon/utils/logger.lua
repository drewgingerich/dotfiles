local module = {}

hs.console.clearConsole()

function module.log(obj)
	string = hs.inspect.inspect(obj)
	text = hs.styledtext.new(string)
	hs.console.printStyledtext(text)
end

function module.alert(obj)
	string = hs.inspect.inspect(obj)
	hs.alert.show(string)
end

return module