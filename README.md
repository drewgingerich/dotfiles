My configuration for various CLI tools, managed using a [bare Git repo](https://www.atlassian.com/git/tutorials/dotfiles).

I primarily interact with the Git repo using [lazygit](https://github.com/jesseduffield/lazygit), which gives a nice TUI. For ease of use, I created an alias to start lazygit with the necessary flags: `alias dfs="lazygit --git-dir $HOME/.dotfiles --work-tree $HOME"`.
