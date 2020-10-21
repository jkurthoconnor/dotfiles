# kubectl autocompletion adds ~200ms to sourcing .bashrc enable; source via function instead
function init-kcomplete {
  if type kubectl > /dev/null 2>&1; then
    source <(kubectl completion bash | sed s/kubectl/k/g)
  else
    echo 'kubectl is not installed'
  fi
}

# NVM adds ~400ms to sourcing .bashrc; init only as needed
function init-nvm {
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

function okta-aws() {
  case "$1" in
    "-f"|"--force") rm ~/.aws/credentials
                    ~/.virtualenvs/okta-awscli-venv/bin/okta-awscli --profile okta-aws
                    ln ~/.aws/credentials ~/code/bluebird-spinner/bbspinner-dev/data/aws/credentials ;;
    *)              ~/.virtualenvs/okta-awscli-venv/bin/okta-awscli --profile okta-aws ;;
  esac

  export AWS_PROFILE=okta-aws
}

# facilitate ssh-ing
function ssh-dev() {
  ssh $1.dev.bb.schrodinger.com
}

function ssh-bb() {
  ssh $1.bb.schrodinger.com
}

function ssh-on() {
  ssh $1.onschrodinger.com
}

function ssh-bast() {
  ssh -J bastille.bb.schrodinger.com $1.onschrodinger.com
}
