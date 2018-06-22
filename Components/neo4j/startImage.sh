#!/bin/bash
DOCKER_TAG="neo4j:0_0_1"

#Copy Files form the Packages folder 

PACKAGE_REPO="../../Runtimes/Packages"
source $PACKAGE_REPO/versions.sh


mkdir -p packages
mkdir packages/neo4j && tar -xzvf $PACKAGE_REPO/Neo4j/$NEO4J_PACKAGE --strip-components 1 -C packages/neo4j 


# In the version file are saved all the references to the 
docker build  -t $DOCKER_TAG .
rm -rf packages
