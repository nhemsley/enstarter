# general settings for bash etc.
export HISTSIZE=100000
export SAVEHIST0=100000
# these are readline modifications to tweak the tab completion
bind 'set completion-ignore-case on'
# bind 'set completion-prefix-display-length 2'
# bind 'set completion-map-case on'


export CLICOLOR=1

copy_public_key() {
  cat ~/.ssh/id_rsa.pub | terminal_copy
}

random_string() {
  length=$@
  [[ -z  $length ]]  && length=24
  echo $(dd if=/dev/urandom bs=256 count=1 2> /dev/null | env LC_ALL=C tr -dc 'a-zA-Z0-9' | head -c $length)
}
