#!/bin/bash
cp /usr/ifi/ifi-tidal-release/ifi-streamer-tidal-connect.service /lib/systemd/system/
chmod +x /usr/ifi/ifi-tidal-release/play
chmod +x /usr/ifi/ifi-tidal-release/pa_devs/run.sh
#systemctl enable ifi-streamer-tidal-connect.service
