PS1="[\W]$ "
export VISUAL=emacs
export EDITOR=vim
export PATH="~/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

ssht() {
  ssh -q -Y $1 -t -- "tmux new -A -s default"
}

dir-archive() {
  [[ "${1}" != */ ]] && SRC="${1}/"
  [[ "${2}" != */ ]] && DEST="${2}/"

  additionaFlags=""

  read -p "Dry run? (y/n):" dry
  if [[ "$dry" =~ (yes|y|Y) ]]; then 
    additionalFlags="$additionalFlags"n
  fi

  read -p "Follow symlinks? (y/n):" followLinks
  if [[ "$followLinks" =~ (yes|y|Y) ]]; then 
    additionalFlags="$additionalFlags"lL
  fi

  read -p "Update "${DEST}" with contents of "${SRC}"? (y/n)" continue
  if [[ "$continue" =~ (yes|y|Y) ]]; then 
    rsync -vr"$additionalFlags" --ignore-existing "$SRC" "$DEST"
  fi
}

dir-push() {
  [[ "${1}" != */ ]] && SRC="${1}/"
  [[ "${2}" != */ ]] && DEST="${2}/"

  additionaFlags=""

  read -p "Dry run? (y/n):" dry
  if [[ "$dry" =~ (yes|y|Y) ]]; then 
    additionalFlags="$additionalFlags"n
  fi

  read -p "Follow symlinks? (y/n):" followLinks
  if [[ "$followLinks" =~ (yes|y|Y) ]]; then 
    additionalFlags="$additionalFlags"lL
  fi

  read -p "Overwrite "${DEST}" with contents of "${SRC}"? (y/n)" continue
  if [[ "$continue" =~ (yes|y|Y) ]]; then 
    rsync -vr"additionalFlags" --ignore-existing --force --delete "$SRC" "$DEST"
  fi
}
