
for install in $(ls -d $ENSTARTER_INSTALLS_DIR/*/); do
  ENV_FILE=$install/env.sh
  cat $INSTALL_FILE

done
