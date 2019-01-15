PS1="[\W]$ "
export VISUAL=emacs
export EDITOR=vim
export PATH="~/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

ssht() {
   ssh -q -Y $1 -t -- "tmux new -A -s default"
   if (( $? )); then
      ssh -q -Y acc.ohsu.edu -t ssh $1 -X -t -- "tmux new -A -s default"
   fi
}
