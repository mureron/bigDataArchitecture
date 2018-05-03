#!/usr/bin/env bash

export RUNTIME_DIR=/BDaaS/dependencies
export JAVA_HOME="$RUNTIME_DIR/jre"
export SPARK_HOME="$RUNTIME_DIR/spark"
export PATH="$RUNTIME_DIR/miniconda/bin:$PATH:$JAVA_HOME/bin:$SPARK_HOME/bin"


# Start spark master and worker services

echo "$SPARK_HOME/sbin/start-master.sh -h $HOSTNAME -p 7077 --webui-port 8080" 

$SPARK_HOME/sbin/start-master.sh -h $HOSTNAME -p 7077 --webui-port 8080 &


# Run in daemon mode, don't exit
while true; do
  sleep 100;
done