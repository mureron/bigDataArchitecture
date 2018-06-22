#!/bin/bash
DOCKER_TAG="jupyterlab-tf:0_0_1"

# In the version file are saved all the references to the 
docker build  -t $DOCKER_TAG .