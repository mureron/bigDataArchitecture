#!/bin/bash
DOCKER_TAG="jupyterlab"

# In the version file are saved all the references to the 
docker build  -t $DOCKER_TAG .
