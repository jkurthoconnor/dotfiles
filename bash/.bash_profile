
[[ -s "$HOME/.profile" ]] && . "$HOME/.profile" # Load the default .profile

if [ -z "$DISPLAY" -a $XDG_VTNR -eq 1 ]; then
  startx
fi


if [ -d "$HOME/.rvm" ]; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi
