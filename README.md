# Tidal Connect Docker image (for RaspberryPi)

Image based on https://github.com/shawaj/ifi-tidal-release and https://github.com/seniorgod/ifi-tidal-release. 
Please visit https://www.raspberrypi.org/forums/viewtopic.php?t=297771 for full information on the backround of this project.

# Why this Docker Port

I have been hapilly using HifiberryOS but beeing an extremely slim OS (based on Buildroot) has its pitfalls, that there is no easy way of extending its current features. Thankfully the Hifiberry Team have blessed us by providing Docker and Docker-Compose within OS.
As I didnt want to add yet another system for Tidal integration (e.g. Bluesound, Volumio), i stumbled upon this https://support.hifiberry.com/hc/en-us/community/posts/360013667717-Tidal-Connect-, and i decided to do something about it. 

# Installation

1. SSH into your Raspberry and clone/copy this repository onto your system. 
```
# On HifiberryOS
curl https://codeload.github.com/TonyTromp/tidal-connect-docker/zip/refs/heads/master >tidal-connect-docker.zip
unzip tidal-connect-docker.zip

# On Raspbian
git clone https://github.com/TonyTromp/tidal-connect-docker.git

```
2. Build the docker image:

NOTE: I have already uploaded a image to Docker Hub, which means you can skip this time consuming step and go directly to step 3.

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


# Run docker image as daemon (start Tidal Connect)
docker-compose up -d

# Stop docker image (stop Tidal Connect)
docker-compose down
```


# *** Other Stuff *** #


Running as daemon without using docker-compose 
```
 docker run -td \
 --network="host" \
 --dns 8.8.8.8 \
 --device /dev/snd \
 -v /var/run/dbus:/var/run/dbus \
 edgecrush3r/tidal-connect:latest 

```

# Debugging

```
docker run -ti \
 --network="host" \
 --dns 8.8.8.8 \
 --device /dev/snd \
 -v /var/run/dbus:/var/run/dbus \
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

# Tweaking and tuning configuration
If you need to alter any parameters, just change the entrypoint.sh to contain whatever settinsgs you need
The entrypoint.sh file/command is executed upon start of the container and mounted via docker-compose.

