#!/usr/bin/env bash

export RUNTIME_DIR=/BDaaS/dependencies
export SPARK_HOME="$RUNTIME_DIR/spark"
export PATH="$PATH:$JAVA_HOME/bin:$SPARK_HOME/bin"

echo "Worker: $HOSTNAME Connected to spark://$MASTER_HOSTNAME:$MASTER_PORT --webui-port $MASTER_WEBUI_PORT" 

# Starting the Spark Worker 
$SPARK_HOME/sbin/../bin/spark-class org.apache.spark.deploy.worker.Worker spark://$MASTER_HOSTNAME:$MASTER_PORT --webui-port $WORKER_WEBUI_PORT 
