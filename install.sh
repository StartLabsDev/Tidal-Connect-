#!/bin/bash

# Enable service
printf "\nEnabling Tidal Service...\n"
#cp systemd/tidal.service /etc/systemd/system/
eval "echo \"$(cat systemd/tidal.service)\"" >/etc/systemd/system/tidal.service


systemctl enable tidal.service

# Add Tidal Source to Beocreate
SYMLINK_FOLDER=/opt/beocreate/beo-extensions/tidal
if [ -L "$SYMLINK_FOLDER" ]; then
  # Already installed... remove symlink and re-install
  echo "Tidal extension found, removing previous install..."
  rm $SYMLINK_FOLDER
fi

printf  "\nAdding Tidal Source to Beocreate UI...\n"
ln -s ${PWD}/beocreate/beo-extensions/tidal /opt/beocreate/beo-extensions/tidal

printf "\n\nInstallation Completed...\n"

if [ "$(docker ps -q -f name=docker_tidal-connect)" ]; then
  ./stop-tidal-service.sh
fi
./start-tidal-service.sh

./restart_beocreate2.sh
