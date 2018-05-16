#!/usr/bin/env bash

export RUNTIME_DIR=/BDaaS/dependencies
export SPARK_HOME="$RUNTIME_DIR/spark"
export PATH="$PATH:$SPARK_HOME/bin"

# Start spark master and worker services

echo "$SPARK_HOME/sbin/start-master.sh -h $HOSTNAME -p $MASTER_PORT --webui-port $MASTER_WEBUI_PORT" 

$SPARK_HOME/sbin/../bin/spark-class org.apache.spark.deploy.master.Master -h $HOSTNAME -p $MASTER_PORT --webui-port $MASTER_WEBUI_PORT
