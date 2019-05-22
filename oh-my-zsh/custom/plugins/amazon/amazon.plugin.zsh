AMAZON_AUTH_CHECK_DEBUG=false

kinit_renew() {
  echo " renewing Kinit"
  kinit -f -l 7d -r 30d
}

# Run ssh agent when it does not exist
function run_ssh_agent() {
if pgrep ssh-agent > /dev/null
then
  echo "ssh-agent is already running"
  # Do something knowing the pid exists, i.e. the process with $PID is running
else
  eval `ssh-agent -s`
fi
}

#
# mwinit_validate
function mwinit_validate() {
  echo "checking for Midway authentication"
  if (! test -f ~/.midway/cookie) || [ $(grep HttpOnly_midway-auth.amazon.com ~/.midway/cookie | cut -d $'\t' -f 5) -lt $( date  +%s ) ]; then
 #local SSH_CERT=~/.ssh/id_rsa-cert.pub
 #if (! test -f "$SSH_CERT") || (test "`find ~/.ssh/id_rsa-cert.pub -mmin +1220`"); then
   echo "Midway expired. Please re-authenticate."
   if mwinit -o ; then
      run_ssh_agent
      ssh-add -D ~/.ssh/*_rsa
      ssh-add ~/.ssh/*_rsa
   else
     echo "Failed to authenticate."
   fi
 fi
}

function quiet_auth_check() {
  # run kinit_renew when logging in if no kerberos ticket
  if ! klist -s; then
    echo -n "%{$fg[red]%}K"
  else
    echo -n "%{$fg[green]%}K"
  fi
  if (! test -f ~/.midway/cookie) || [ $(grep HttpOnly_midway-auth.amazon.com ~/.midway/cookie | cut -d $'\t' -f 5) -lt $( date  +%s ) ]; then
    echo "%{$fg[red]%}M"
  else
    echo "%{$fg[green]%}M"
  fi
}

function amazon_auth_prompt() {
  local AZM_AUTH_PROMPT_PREFIX="%{$fg[red]%}<%{$fg_bold[red]%}"
  local AZM_AUTH_PROMPT_SUFFIX="%{$reset_color%}%{$fg[red]%}>%{$reset_color%} "
  local k=false
  local m=false
  if ! klist -s; then
    echo -n "$AZM_AUTH_PROMPT_PREFIX"
    echo -n "K"
    k=true
  fi

  if (! test -f ~/.midway/cookie) || [ $(grep HttpOnly_midway-auth.amazon.com ~/.midway/cookie | cut -d $'\t' -f 5) -lt $( date  +%s ) ]; then
    if [ "$k" = false ]; then
      echo -n "$AZM_AUTH_PROMPT_PREFIX"
    fi
    echo -n "M$AZM_AUTH_PROMPT_SUFFIX"
    m=true
  fi
  if [ "$m" = false ]; then
    if [ "$k" = true ]; then
      echo -n "$AZM_AUTH_PROMPT_SUFFIX"
    fi
  fi
}

function km() {
  echo "checking for Kinit status"
  # run kinit_renew when logging in if no kerberos ticket
  if ! klist -s; then kinit_renew; fi
  mwinit_validate
}
