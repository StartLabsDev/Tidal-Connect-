#!/bin/bash

# Enable service
printf "\nEnabling Tidal Service"
cp systemd/tidal.service /etc/systemd/system/
systemctl enable tidal.service

# Add Tidal Source to Beocreate
SYMLINK_FOLDER=/opt/beocreate/beo-extensions/tidal
if [ -L "$SYMLINK_FOLDER" ]; then
  # Already installed... remove symlink and re-install
  rm $SYMLINK_FOLDER
fi

printf  "\nAdding Tidal Source to Beocreate UI"
ln -s ${PWD}/beocreate/beo-extensions/tidal /opt/beocreate/beo-extensions/tidal

printf "\n\nInstallation Completed..."

printf "\nStarting Tidal Connect Service..."
systemctl start tidal.service

printf "\n\nInstallation Completed...\n\n"
