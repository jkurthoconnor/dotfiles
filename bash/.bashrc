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


# PROMPT
##################################

function ruby_env() {
  blue_color="\001\033[01;34m\002"

  if [[ -n $SHOW_RUBY_PROMPT && -d $HOME/.rbenv ]]; then
    RUBY_VER=$(rbenv version | cut -d' ' -f1)
    echo -e " ${blue_color}rb:${RUBY_VER}"
  fi
}

# disable the default py virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1

function py_env() {
  blue_color="\001\033[01;34m\002"

  if [ -n "$VIRTUAL_ENV" ]; then
    echo -e " ${blue_color}${VIRTUAL_ENV##*/}"
  fi
}

function git_state() {
  branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')

  red_color="\001\033[01;31m\002"
  green_color="\001\033[01;32m\002"

  if [[ -n "$branch" && -n "$(git status --short)" ]]; then
    echo -e " ${red_color}(${branch})"
  elif [ -n "$branch" ]; then
    echo -e " ${green_color}(${branch})"
  fi
}

# set variable identifying the chroot you work in
if [[ -z "${debian_chroot:-}" && -r /etc/debian_chroot ]]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(git_state)$(py_env)$(ruby_env)\[\033[01;32m\]\$\[\033[00m\] '

#################

# enable color support of ls
# sets colors via ~/.dircolors if it exists, or uses the default
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

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

# NVM adds ~400ms to sourcing .bashrc; functions sources only as needed
function nvm-init {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

# function toggles Ruby version in prompt
function ruby_prompt() {
    case "$1" in
      "show") export SHOW_RUBY_PROMPT=yes;;
      "hide") unset SHOW_RUBY_PROMPT;;
      *)      echo "options are to 'show' or 'hide'";;
    esac
}

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

if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [ -d "$HOME/.virtualenvs" ]; then
  export WORKON_HOME=$HOME/.virtualenvs
  export PROJECT_HOME=$HOME/code
  source $HOME/.local/bin/virtualenvwrapper.sh
fi

export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_231
export JAVA_HOME_COMPILE=$JAVA_HOME
export JAVA=$JAVA_HOME/bin/java

# if machine uses .rvm, add RVM to PATH for scripting. Make sure this is the last PATH variable change.
if [ -d "$HOME/.rvm" ]; then
  export PATH="$PATH:$HOME/.rvm/bin"
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi

