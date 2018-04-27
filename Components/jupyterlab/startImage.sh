#!/bin/bash
DOCKER_TAG="jupyterlab:0_0_1"

LIB_DEPENDENCY="../../AdditionalInfo/library/"

mkdir -p packages
cp $LIB_DEPENDENCY/lib_requirements.txt packages
# In the version file are saved all the references to the 
docker build  -t $DOCKER_TAG .

rm -rf packages