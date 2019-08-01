for install in $(ls -d $ENSTARTER_INSTALLS_DIR/*/); do
  ENV_FILE=$install/env.sh
  [ -f $ENV_FILE ] && source $ENV_FILE
done

for env_file in $(ls $ENSTARTER_ENV_DIR/*.sh); do
  [ -f $env_file ] && source $env_file
done
