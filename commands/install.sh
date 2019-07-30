
TO_INSTALL=$(ls -d $ENSTARTER_INSTALLS_DIR/*/ | sort -r)
for install in $TO_INSTALL; do
  INSTALL_FILE=$install/install.sh
  [ -f $INSTALL_FILE ] && source $INSTALL_FILE
  ENV_FILE=$install/env.sh
  [ -f $ENV_FILE ] && source $ENV_FILE
done
