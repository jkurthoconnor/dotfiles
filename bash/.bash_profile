
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# kell runs without a display manager, so start x
if [ $HOSTNAME = kell ]; then
  if [ -z "$DISPLAY" -a $XDG_VTNR -eq 1 ]; then
    startx
  fi
fi

