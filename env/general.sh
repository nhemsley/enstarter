# general settings for bash etc.
export HISTSIZE=100000
export SAVEHIST0=100000
# these are readline modifications to tweak the tab completion
# bind 'set completion-ignore-case on'
# bind 'set completion-prefix-display-length 2'
# bind 'set completion-map-case on'

copy_public_key() {
  cat ~/.ssh/id_rsa.pub | clipboard
}
