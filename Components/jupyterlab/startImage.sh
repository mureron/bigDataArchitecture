#!/bin/bash
DOCKER_TAG="jupyterlab:0_0_1"

PACKAGE_REPO="../../Runtimes/Packages"

# In the version file are saved all the references to the 
source $PACKAGE_REPO/versions.sh


LIB_DEPENDENCY="../../AdditionalInfo/library/"

mkdir -p packages
cp $LIB_DEPENDENCY/lib_requirements.txt packages

#Including the Spark Support

mkdir packages/spark && tar -xzvf $PACKAGE_REPO/Spark/$SPARK_PACKAGE1 --strip-components 1 -C packages/spark


# In the version file are saved all the references to the 
docker build  -t $DOCKER_TAG .
rm -rf packages