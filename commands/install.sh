TO_INSTALL=$(ls -d $ENSTARTER_INSTALLS_DIR/*/ | sort)

for install in $TO_INSTALL; do
  echo "Installing $(basename $install) ..."
  INSTALL_FILE=$install/install.sh
  [ -f $INSTALL_FILE ] && INSTALL_OUTPUT=$(source $INSTALL_FILE 2>&1)
  ENV_FILE=$install/env.sh
  [ -f $ENV_FILE ] && ENV_OUTPUT=$(source $ENV_FILE)
done
