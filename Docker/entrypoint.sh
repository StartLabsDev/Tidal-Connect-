#!/bin/bash

echo "Starting Tidal Connect.."

/app/ifi-tidal-release/bin/tidal_connect_application \
   --tc-certificate-path "/app/ifi-tidal-release/id_certificate/IfiAudio_ZenStream.dat" \
   -f "Hifiberry Tidal Connect" \
   --codec-mpegh true \
   --codec-mqa false \
   --model-name "Hifiberry Tidal Connect" \
   --disable-app-security false \
   --disable-web-security false \
   --enable-mqa-passthrough false \
   --log-level 3 \
   --enable-websocket-log "0" \

echo "Tidal Connect Container Stopped.."
