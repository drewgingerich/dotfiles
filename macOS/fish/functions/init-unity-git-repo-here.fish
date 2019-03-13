function init-unity-git-repo-here -a "remote-repo-url" -d "Sets up a git repo for a Unity project."

	if _confirm "You're in the top level of a new Unity project, right? [Y/n]: "
		echo "Great! Continuing..."
	else
		echo "No? All right. Exiting..."
		return 0
	end

	echo "Initializing git repo..."
	git init

	echo "Downloading basic Unity .gitignore..."
	curl -o .gitignore https://raw.githubusercontent.com/github/gitignore/master/Unity.gitignore

	echo "Commiting gitignore file..."
	git add .gitignore
	git commit -m "Add initial gitignore file."

	echo "Installing git lfs to repo..."
	git lfs install

	set TRACKED_FILETYPES '*.psd' '*.png' '*.ase' '*.jpg' '*.mov' '*.wav' '*.mp3' '*.ogg' '.als' 'Music/**'
	for filetype in $TRACKED_FILETYPES
		echo "Adding $filetype to git lfs tracking..."
		git lfs track $filetype
	end

	echo "Comitting gitattributes file..."
	git add .gitattributes
	git commit -m "Add initial gitattributes file."

	echo "Committing initial Unity project files..."
	git add --all
	git commit -m "Setup new Unity project."

	if test -n "$remote-repo-url"
		echo "No url for remote repo given. Exiting..."
		return 0
	end

	if _confirm "Adding $remote-repo-url as the remote git repo. Does this url look right? [Y/n]: "
		echo "Great! Continuing..."
	else
		echo "No? All right. Exiting..."
		return 0
	end

	echo "Adding remote repo..."
	git remote add origin "$remote-repo-url"
	git remote -v

	echo "Pushing changes to remote repo..."
	git push origin master

	echo "Done. GLHF!"
end
