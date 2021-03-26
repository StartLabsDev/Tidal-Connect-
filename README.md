# Tidal Connect Docker image (for RaspberryPi)

Image based on https://github.com/shawaj/ifi-tidal-release. Please visit for full information.

# Installation

1. Clone repository on your RasberryPi.
2. cd into Docker
3. Execute ./build_docker.sh
4. Run using
```
 docker run -td --device /dev/snd edgecrush3r/ifi-tidal-connect:latest
```

