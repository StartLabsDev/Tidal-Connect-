#!/bin/bash

echo "Building Docker image: edgecrush3r/ifi-tidal-connect"
cd .. &&  docker build -f Docker/Dockerfile -t edgecrush3r/ifi-tidal-connect .
echo "Done..."
