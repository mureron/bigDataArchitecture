#!/usr/bin/env bash

export RUNTIME_DIR=/BDaaS/dependencies
export JAVA_HOME="$RUNTIME_DIR/jre"
export SPARK_HOME="$RUNTIME_DIR/spark"
export PATH="$RUNTIME_DIR/miniconda/bin:$PATH:$JAVA_HOME/bin:$SPARK_HOME/bin"


$SPARK_HOME/sbin/./start-slave.sh spark://$MASTER_HOSTNAME:7077

while true; do
  sleep 100;
done