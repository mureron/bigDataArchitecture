#!/bin/bash
DOCKER_TAG="jupyter"

# In the version file are saved all the references to the 
docker build  -t $DOCKER_TAG .
