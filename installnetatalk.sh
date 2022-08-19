[ -z $BASH ] && { exec bash "$0" "$@" || exit; }
#!/bin/bash
#
# This script will install required software for Using netatalk


# Install netatalk and append home directory
echo '>>> Install netatalk'
REQUIRED_PKG="netatalk"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install o>
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  apt-get --yes install $REQUIRED_PKG
  echo 'editing home directory'
  echo '
[Homes]
   basedir regex = /home' | sudo tee -a /etc/netatalk/afp.conf
else
  echo "Seems $REQUIRED_PKG is installed already, skip this step."
fi
