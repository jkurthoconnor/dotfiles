
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

if [ -z "$DISPLAY" -a $XDG_VTNR -eq 1 ]; then
  startx
fi

