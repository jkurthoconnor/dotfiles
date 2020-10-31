# ---------------
# ls & dir aliases
# ----------------
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias dirs='dirs -v'

# ---------------
# grep aliases
# ----------------
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ------------
# git aliases
# -------------
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit -a'
alias gcv='git commit --verbose'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias gl='git log'
alias gll='git log --oneline'
alias gla='git log --graph --all --decorate --oneline'
alias glg='git log -E -i --grep'
alias gm='git merge'
alias gpl='git pull'
alias gps='git push'
alias gr='git rm'
alias gs='git status'
alias gsu='git submodule update --init'

# ------------
# tmux aliases
# ------------
alias tl='tmux list-sessions'
alias tn='tmux new-session -s'
alias ta='tmux attach -t'
alias tk='tmux kill-session -t'

# ------------
# misc application aliases
# ------------
alias ch='cheat'
alias bat='batcat'

alias k='kubectl'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

