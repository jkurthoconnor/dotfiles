# ---------------
# ls & dir aliases
# ----------------

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias dirs='dirs -v'

# ------------
# git aliases
# -------------

alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gca='git commit -a'
alias gcv='git commit --verbose'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias gl='git log'
alias gla='git log --graph --all --decorate --oneline'
alias glg='git log -E -i --grep'
alias gpl='git pull'
alias gps='git push'
alias gr='git rm'
alias gs='git status'

# ------------
# ------------

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

