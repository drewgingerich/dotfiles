function ssht -a "remote" -d "SSH into remote and log into a default tmux instance."
    ssh -q -Y $remote -t -- "tmux new -A -s default"
end
