function _confirm
	if count $argv > /dev/null
		set prompt "$argv[1] [Y/n]: " 
	else
		set prompt "Do you want to continue? [Y/n]: " 
	end

	read -l -P $prompt confirm
	switch $confirm
		case Y y Yes yes YEPPERS ""
			return 0
		case '*'
			return 1
	end
end