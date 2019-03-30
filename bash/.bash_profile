
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# kell runs without a display manager, so start x
# TODO remove kell condition once desktop is configured without a display manager
if [ $HOSTNAME = kell ]; then
  if [ -z "$DISPLAY" -a $XDG_VTNR -eq 1 ]; then
    startx
  fi
fi

