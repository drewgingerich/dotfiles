function tv -a watchedTag
	set defaultTag "Gray"

	if test (count $argv) -eq 0
		set watchedTag $defaultTag
	end

	for episode in (ls)
		tag --list --no-name $episode | grep $watchedTag > /dev/null
		if test $status -ne 0 
			tag -a $watchedTag $episode
			open $episode
			break
		end
	end
end