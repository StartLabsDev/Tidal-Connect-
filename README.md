# Tidal Connect Docker image (for RaspberryPi)

Image based on https://github.com/shawaj/ifi-tidal-release. Please visit for full information.

# Installation

1. Clone repository on your RasberryPi.
2. cd into Docker folder (important)
3. Execute ./build_docker.sh
4. Run using
```
docker run -td \
  --device /dev/snd \
  -v /var/run/dbus:/var/run/dbus \
  -v /var/run/avahi-daemon/socket:/var/run/avahi-daemon/socket \
  edgecrush3r/tidal-connect:latest
```

# Debugging

1. To debug the image. Edit the Docker file and comment out (with #) the ENTRYPOINT ["/entrypoint.sh"]
```
#  ENTRYPOINT ["entrypoint.sh"]
```
2. build image using ./build_docker.sh
3. Enter shell mode using
```
docker run -ti \
 --device /dev/snd \
 -v /var/run/dbus:/var/run/dbus \
 -v /var/run/avahi-daemon/socket:/var/run/avahi-daemon/socket \
 edgecrush3r/tidal-connect \
 /bin/bash
```
## create devices file
./run.sh

## run manually (set playback-device to your device)
```
bin/tidal_connect_application \
--tc-certificate-path "/usr/ifi/ifi-tidal-release/IfiAudio_ZenStream.dat" \
-f "HiTide RasPi Streamer" \
--codec-mpegh false \
--codec-mqa false \
--model-name "HiTide RasPi Streamer" \
--disable-app-security false \
--disable-web-security false \
--enable-mqa-passthrough false \
--log-level 3 \
--enable-websocket-log "0" \
--netif-for-deviceid wlan0 \
--playback-device "snd_rpi_hifiberry_dac: HifiBerry DAC HiFi pcm5102a-hifi-0 (hw:0,0)"
```
