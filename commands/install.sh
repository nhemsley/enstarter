for install in $(ls -d $ENSTARTER_INSTALLS_DIR/*/); do
  ENV_FILE=$install/install.sh
  [ -f $ENV_FILE ] && source $ENV_FILE
done
