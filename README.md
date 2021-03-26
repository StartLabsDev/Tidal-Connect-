# Tidal Connect Docker image (for RaspberryPi)

Image based on https://github.com/shawaj/ifi-tidal-release. Please visit for full information.

# Installation

1. Clone repository on your RasberryPi. Note if you are using Hifiberry, you can get the file directly using 
```
curl -O https://github.com/TonyTromp/tidal-connect-docker/archive/refs/heads/master.zipcurl -O https://github.com/TonyTromp/tidal-connect-docker/archive/refs/heads/master.zip

unzip master.zip
```
2. cd into Docker folder (important)
3. Execute ./build_docker.sh
4. RUN (foreground) using
```
 docker run -ti \
 --network="host" \
 --device /dev/snd \
 --dns 8.8.8.8 \
 -v /var/run/dbus:/var/run/dbus \
 edgecrush3r/tidal-connect:latest /app/ifi-tidal-release/bin/tidal_connect_application \
   --tc-certificate-path "/app/ifi-tidal-release/id_certificate/IfiAudio_ZenStream.dat" \
   -f "Hifiberry Tidal Connect" \
   --codec-mpegh true \
   --codec-mqa false \
   --model-name "HiTide RasPi Streamer" \
   --disable-app-security false \
   --disable-web-security false \
   --enable-mqa-passthrough false \
   --log-level 3 \
   --enable-websocket-log "0" \
```

5. RUN in background as daemon
```
 docker run -td \
 --network="host" \
 --device /dev/snd \
 --dns 8.8.8.8 \
 -v /var/run/dbus:/var/run/dbus \
 edgecrush3r/tidal-connect:latest /app/ifi-tidal-release/bin/tidal_connect_application \
   --tc-certificate-path "/app/ifi-tidal-release/id_certificate/IfiAudio_ZenStream.dat" \
   -f "Hifiberry Tidal Connect" \
   --codec-mpegh true \
   --codec-mqa false \
   --model-name "HiTide RasPi Streamer" \
   --disable-app-security false \
   --disable-web-security false \
   --enable-mqa-passthrough false 
```

# Debugging

```
docker run -ti \
 --device /dev/snd \
 -v /var/run/dbus:/var/run/dbus \
 -v /var/run/avahi-daemon/socket:/var/run/avahi-daemon/socket \
 edgecrush3r/tidal-connect \
 /bin/bash
```
