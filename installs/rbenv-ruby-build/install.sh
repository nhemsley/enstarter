mkdir -p ~/.rbenv/plugins
[ ! -d ~/.rbenv/plugins/ruby-build ] && git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

for version in $(cat $ENSTARTER_CURRENT_INSTALL/install-ruby-versions); do
  echo "Installing Ruby $version"

  RBENV_OUTPUT=$(rbenv install -s $version 2>&1)

  echo $RBENV_OUTPUT
done
