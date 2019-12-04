# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# to ensure `~/.bashrc is read even in login shells:
if [[ -n "$BASH_VERSION"  &&  -f "$HOME/.bashrc" ]]; then
  source "$HOME/.bashrc"
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

