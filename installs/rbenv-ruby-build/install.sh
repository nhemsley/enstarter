mkdir -p ~/.rbenv/plugins
[ ! -d ~/.rbenv/plugins/ruby-build ] && git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

for version in $(cat $ENSTARTER_CURRENT_INSTALL/install-ruby-versions); do
  echo "Installing Ruby $version" > /dev/stderr

  RBENV_OUTPUT=$(rbenv install $version 2>&1)

  echo $RBENV_OUTPUT
done
