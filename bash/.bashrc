# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# ignore lines starting with space or history commands; append
HISTCONTROL=ignorespace
HISTIGNORE="history"
shopt -s histappend
HISTSIZE=100000
HISTFILESIZE=100000

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# source additional customizations; this allows per-machine drop-in env files
if [ -d "$HOME/.bashrc.d" ]; then
  for config in $HOME/.bashrc.d/*; do
    source $config
  done
  unset config
fi

# enable color support of ls
# sets colors via ~/.dircolors if it exists, or uses the default
if [ -x /usr/bin/dircolors ]; then
  test -r $HOME/.dircolors && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"
fi

# To enable programmable completion features, either enable it in /etc/bash.bashrc and ensure /etc/profile sources /etc/bash.bashrc, or insert code here.

# suppress accessibility bus warnings
export NO_AT_BRIDGE=1

# remove <ctl + s> XOFF control sequence
stty -ixon

export EDITOR=vim
export GPG_TTY=$(tty)

if [ -d "$HOME/.twarriors" ]; then
  TASKTIMEWARRIORDIR="$HOME/.twarriors"
  export TIMEWARRIORDB="$TASKTIMEWARRIORDIR/.timewarrior"
  export TASKRC="$TASKTIMEWARRIORDIR/.taskrc"
  export TASKDATA="$TASKTIMEWARRIORDIR/.task"
fi

if [ "$TERM" == "linux" ]; then
  function set-tty-colors {
    gruvbox=(
      "\e]P01d2021" "\e]P8665c54" "\e]P1cc241d" "\e]P9fb4934" "\e]P298971a" \
      "\e]PAb8bb26" "\e]P3d79921" "\e]PBfabd2f" "\e]P4458588" "\e]PC83a598" \
      "\e]P5b16286" "\e]PDd3869b" "\e]P6689d6a" "\e]PE8ec07c" "\e]P7d5c4a1" \
      "\e]PFfbf1c7" 
    )

      echo -en ${gruvbox[*]}
      clear ; unset gruvbox
    }
fi

if [ -d "$HOME/.virtualenvs" ]; then
  [[ $HOSTNAME =~ ^sull ]] && export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
  export WORKON_HOME=$HOME/.virtualenvs
  export PROJECT_HOME=$HOME/code
  source $HOME/.local/bin/virtualenvwrapper.sh
fi

# rbenv & rvm are mortal enemies, but each alone is needed on different machines
# Only one of the two should be on any system
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
