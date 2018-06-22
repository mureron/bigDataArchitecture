#!/bin/bash
DOCKER_TAG="sparkworker:0_0_1"

#Copy Files form the Packages folder 

PACKAGE_REPO="../../Runtimes/Packages"
source $PACKAGE_REPO/versions.sh

LIB_DEPENDENCY="../../AdditionalInfo/library/"

mkdir -p packages
cp $LIB_DEPENDENCY/lib_requirements.txt packages

mkdir packages/spark && tar -xzvf $PACKAGE_REPO/Spark/$SPARK_PACKAGE --strip-components 1 -C packages/spark    

mv packages/spark/conf/spark-env.sh.template packages/spark/conf/spark-env.sh
mv packages/spark/conf/log4j.properties.template packages/spark/conf/log4j.properties
mv packages/spark/conf/spark-defaults.conf.template packages/spark/conf/spark-defaults.conf

#Including HDFS Hadoop datanode

mkdir packages/hadoop && tar -xzvf $PACKAGE_REPO/Hadoop/$HADOOP_PACKAGE --strip-components 1 -C packages/hadoop
rm -rf packages/hadoop/share/doc

# In the version file are saved all the references to the 
docker build  -t $DOCKER_TAG .

rm -rf packages
