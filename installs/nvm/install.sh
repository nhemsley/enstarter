[ ! -d ~/.nvm ] && wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

source $ENSTARTER_CURRENT_INSTALL/env.sh

for version in $(cat $ENSTARTER_CURRENT_INSTALL/install-node-versions); do
  nvm install $version
done

source $ENSTARTER_CURRENT_INSTALL/env.sh

npm install -g yarn
