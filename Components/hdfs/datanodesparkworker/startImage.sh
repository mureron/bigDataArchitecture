#!/bin/bash
DOCKER_TAG="hdfsdatanodesparkworker:0_0_1"

#Copy Files form the Packages folder 

PACKAGE_REPO="../../../Runtimes/Packages"

source $PACKAGE_REPO/versions.sh


mkdir -p packages

#Including HDFS Hadoop
mkdir packages/hadoop && tar -xzvf $PACKAGE_REPO/Hadoop/$HADOOP_PACKAGE --strip-components 1 -C packages/hadoop
rm -rf packages/hadoop/share/doc

#Including the Spark Support
mkdir packages/spark && tar -xzvf $PACKAGE_REPO/Spark/$SPARK_PACKAGE1 --strip-components 1 -C packages/spark

# In the version file are saved all the references to the 
docker build  -t $DOCKER_TAG .

rm -rf packages
