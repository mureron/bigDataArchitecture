#!/bin/bash
DOCKER_TAG="sparkmaster:0_0_1"

#Copy Files form the Packages folder 

PACKAGE_REPO="../../Runtimes/Packages"
source $PACKAGE_REPO/versions.sh

LIB_DEPENDENCY="../../AdditionalInfo/library/"

mkdir -p packages
cp $LIB_DEPENDENCY/lib_requirements.txt packages
cp $PACKAGE_REPO/Spark/$SPARK_PACKAGE packages

mkdir packages/spark && tar -xzvf $PACKAGE_REPO/Spark/$SPARK_PACKAGE --strip-components 1 -C packages/spark

# In the version file are saved all the references to the 
docker build  -t $DOCKER_TAG .
rm -rf packages
