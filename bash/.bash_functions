# NVM adds ~400ms to sourcing .bashrc; init only as needed
function nvm-init {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

# toggle Ruby version in prompt
function ruby_prompt() {
  case "$1" in
    "show") export SHOW_RUBY_PROMPT=yes;;
    "hide") unset SHOW_RUBY_PROMPT;;
    *)      echo "options are to 'show' or 'hide'";;
  esac
}

# facilitate ssh-ing
function dev() {
  ssh $1.dev.bb.schrodinger.com
}

function bb() {
  ssh $1.bb.schrodinger.com
}

function on() {
  ssh $1.onschrodinger.com
}

function bsch() {
  ssh -J bastille.bb.schrodinger.com $1.onschrodinger.com
}
