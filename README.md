# Tidal Connect Docker image (for RaspberryPi)

Image based on https://github.com/shawaj/ifi-tidal-release. Please visit for full information.

# Installation

1. Clone repository on your RasberryPi. Note if you are using Hifiberry, you can get the file directly using 
```
curl https://codeload.github.com/TonyTromp/tidal-connect-docker/zip/refs/heads/master >tidal-connect-docker.zip
unzip tidal-connect-docker.zip
```
2. Build the docker image:
```
# Go to the <tidal-connect-docker>/Docker path
cd tidal-connect-docker-master/Docker

# Build the image
./build_docker.sh
```

3. Run docker image using docker-compose

```
# Go to the <tidal-connect-docker>/Docker path

cd tidal-connect-docker-master/Docker


# Run docker image as daemon
docker-compose up -d

# Stop docker image
docker-compose down
```


# *** Other Stuff *** #


Running without docker-compose (using docker command) 
```
 docker run -td \
 --network="host" \
 --device /dev/snd \
 --dns 8.8.8.8 \
 -v /var/run/dbus:/var/run/dbus \
 edgecrush3r/tidal-connect:latest 

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

List Devices
```
docker run -ti \
--device /dev/snd \
-v /var/run/dbus:/var/run/dbus \
-v /var/run/avahi-daemon/socket:/var/run/avahi-daemon/socket \
--entrypoint /app/ifi-tidal-release/bin/ifi-pa-devs-get edgecrush3r/tidal-connect
```

