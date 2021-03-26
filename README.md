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
  edgecrush3r/ifi-tidal-connect:latest
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
 edgecrush3r/ifi-tidal-connect:latest \
 /bin/bash
```
## create devices file
./run.sh

## run manually (set playback-device to your device)
```
 docker run -ti \
 --network="host" \
 --device /dev/snd \
 --dns 8.8.8.8 \
 -v /var/run/dbus:/var/run/dbus \
 edgecrush3r/ifi-tidal-connect:latest /bin/bash
```
