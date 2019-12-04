# login shells read `/etc/profile` and the first of `~/.bash_profile`, `~/.bash_login`, `~/profile`

[[ -s "$HOME/.profile" ]] && . "$HOME/.profile"

if [ -z "$DISPLAY" -a $XDG_VTNR -eq 1 ]; then
  startx
fi
