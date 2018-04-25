#!/bin/bash
DOCKER_TAG="basicbd3"
PACKAGE_REPO="../Packages"

# In the version file are saved all the references to the 
source $PACKAGE_REPO/versions.sh

mkdir -p packages

# Copy file to be trasnferred to the Docker instance

cp $PACKAGE_REPO/Python/$MINICONDA3_PACKAGE packages
cp $PACKAGE_REPO/Java/$JAVA_PACKAGE packages

mkdir packages/jre  && tar -xzvf $PACKAGE_REPO/Java/$JAVA_PACKAGE --strip-components 1 -C packages/jre    

docker build  -t $DOCKER_TAG    \
    --build-arg MINICONDA3_PACKAGE=$MINICONDA3_PACKAGE \
    .
 rm -rf packages