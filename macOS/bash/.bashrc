PS1="[\W]$ "
export VISUAL=emacs
export EDITOR=vim
export PATH="~/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

ssht() {
  ssh -q -Y $1 -t -- "tmux new -A -s default"
}

dir-archive() {
  local SRC="${1}"
  [[ "${1}" != */ ]] && SRC="${1}/"

  local DEST="${2}"
  [[ "${2}" != */ ]] && DEST="${2}/"

  local FLAGS="-vrl"

  read -p "Dry run? (y/n): " dry
  if [[ "$dry" =~ (yes|y|Y) ]]; then 
    echo "Will do a dry run."
    FLAGS="$FLAGS"n
  fi

#  read -p "Follow symlinks? (y/n): " followLinks
#  if [[ "$followLinks" =~ (yes|y|Y) ]]; then 
#    echo "Will follow symlinks."
#    FLAGS="$FLAGS"L
#  fi

  read -p "This will update \""${DEST}"\" with contents of \""${SRC}"\". Continue? (y/n): " continue
  if [[ "$continue" =~ (yes|y|Y) ]]; then 
    rsync "$FLAGS" --ignore-existing "$SRC" "$DEST"
  fi
}

dir-push() {
  local SRC="${1}"
  [[ "${1}" != */ ]] && SRC="${1}/"

  local DEST="${2}"
  [[ "${2}" != */ ]] && DEST="${2}/"

  local FLAGS="-vrl"

  read -p "Dry run? (y/n): " dry
  if [[ "$dry" =~ (yes|y|Y) ]]; then 
    echo "Will do a dry run."
    FLAGS="$FLAGS"n
  fi

#  read -p "Follow symlinks? (y/n): " followLinks
#  if [[ "$followLinks" =~ (yes|y|Y) ]]; then 
#    echo "Will follow symlinks."
#    FLAGS="$FLAGS"L
#  fi

  read -p "This will overwrite \""${DEST}"\" with contents of \""${SRC}"\". Continue? (y/n): " continue
  if [[ "$continue" =~ (yes|y|Y) ]]; then 
    rsync "$FLAGS" --ignore-existing --force --delete "$SRC" "$DEST"
  fi
}
