#!/bin/bash


enstarter_apt_installed() {
  #https://askubuntu.com/questions/2389/generating-list-of-manually-installed-packages-and-querying-individual-packages
  comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)
}

for i in "$@"
do
  shift
  case $i in
    installed)
      #only show if we have empty arguments
      [ -z "$@" ] && enstarter_apt_installed

    ;;
    to-install)
      #only show if we have empty arguments
      cat $ENSTARTER_CONFIG_DIR/apt-installs
    ;;
    save)
      INSTALLED=$(enstarter_apt_installed)
      echo $INSTALLED > $ENSTARTER_ORIGIN/config/apt-installs
    ;;
    load)
      if [ -f $ENSTARTER_ORIGIN/config/apt-installs ] ; then
        APT_INSTALLS_CONTENT=$(cat $ENSTARTER_ORIGIN/config/apt-installs)
        [ ! -z "$APT_INSTALLS_CONTENT" ] & apt install $APT_INSTALLS_CONTENT
      fi
    ;;
      *)
              # unknown option
      ;;
  esac
done
