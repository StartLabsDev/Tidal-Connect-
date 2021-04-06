#!/bin/bash

# Enable service
printf "\nEnabling Tidal Service"
cp systemd/tidal.service /etc/systemd/system/
systemctl enable tidal.service

# Add Tidal Source to Beocreate
printf  "\nAdding Tidal Source to Beocreate UI"
ln -s /opt/beocreate/beo-extensions/tidal ${PWD}/beocreate/beo-extensions/tidal

printf "\nStarting Tidal Connect Service..."
systemctl start tidal.service

printf "\n\nInstallation Completed..."
