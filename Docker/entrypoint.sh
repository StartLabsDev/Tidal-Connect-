#!/bin/bash


echo "Starting Tidal Connect.."
nohup /app/ifi-tidal-release/bin/tidal_connect_application \
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
   &
sleep 10
ps aux | grep tidal
 
echo "Starting Speaker Control Application.."
/app/ifi-tidal-release/bin/speaker_controller_application 


echo "Tidal Connect Container Stopped.."
