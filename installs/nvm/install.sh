[ ! -d ~/.nvm ] && wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

source $ENSTARTER_CURRENT_INSTALL/env.sh

for version in $(cat $ENSTARTER_CURRENT_INSTALL/install-node-versions); do
  # echo "Installing Node $version"

  nvm install $version

done
