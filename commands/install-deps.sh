for dependancy in $(ls -d $ENSTARTER_INSTALLS_DIR/*/); do
  DEPENDENCY_FILE=$dependancy/apt-deps
  [ -f $DEPENDENCY_FILE ] && apt install $(cat $DEPENDENCY_FILE)
done
