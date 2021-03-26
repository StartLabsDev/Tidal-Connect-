#!/bin/bash

ls -l /usr/ifi/ifi-tidal-release/bin/

/usr/ifi/ifi-tidal-release/bin/tidal_connect_application \
--tc-certificate-path "/usr/ifi/ifi-tidal-release/id_certificate/IfiAudio_ZenStream.dat" \
-f "HiTide RasPi Streamer" \
--codec-mpegh true \
--codec-mqa false \
--model-name "HiTide RasPi Streamer" \
--disable-app-security false \
--disable-web-security false \
--enable-mqa-passthrough false \
--log-level 3 \
--enable-websocket-log "0"

