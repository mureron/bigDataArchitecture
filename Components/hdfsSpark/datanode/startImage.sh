#!/bin/bash
DOCKER_TAG="hdfsdatanode:0_0_1"

#Copy Files form the Packages folder 

PACKAGE_REPO="../../../Runtimes/Packages"

source $PACKAGE_REPO/versions.sh


mkdir -p packages

mkdir packages/hadoop && tar -xzvf $PACKAGE_REPO/Hadoop/$HADOOP_PACKAGE --strip-components 1 -C packages/hadoop
rm -rf packages/hadoop/share/doc

# In the version file are saved all the references to the 
docker build  -t $DOCKER_TAG .

rm -rf packages
