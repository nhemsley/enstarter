SYSTEM_ARCH=$(uname)
SYSTEM_SCRIPT_DIR=$ENSTARTER_ENV_DIR/systems/$SYSTEM_ARCH

if [ -d $SYSTEM_SCRIPT_DIR ]; then
  for system_script in $(ls $SYSTEM_SCRIPT_DIR/*.sh); do
    [ -f $system_script ] && source $system_script
  done
fi

for install in $(ls -d $ENSTARTER_INSTALLS_DIR/*/); do
  ENV_FILE=$install/env.sh
  [ -f $ENV_FILE ] && source $ENV_FILE
done

for env_file in $(ls $ENSTARTER_ENV_DIR/*.sh); do
  [ -f $env_file ] && source $env_file
done

#get experiment paths
export PATH="$PATH:$(enstarter experiment paths)"
