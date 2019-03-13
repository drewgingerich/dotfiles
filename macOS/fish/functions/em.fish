function em -a subject
	# Checks if there's a frame open
	set elisp "(if (> (length (frame-list)) 1) 't)"
	emacsclient -n -e $elisp 2> /dev/null | grep t > /dev/null

 	if test $status -eq "1"
		set flags -a "" -nqc
 	else
		set flags -nq
	end

	if count $argv > /dev/null
		switch $subject
			case write
				set target "~/active/writing/"
			case org
				set target "~/archive/life/org"
			case note
				set target "~/archive/life/org/notes.org"
			case "*"
				set target "$argv[1]"
				return 0
		end
	else
		set target "~/active/"
	end

 	emacsclient $flags $target > /dev/null
end
