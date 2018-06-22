#!/usr/bin/env bash

export RUNTIME_DIR=/eslap/legacy
export JAVA_HOME="$RUNTIME_DIR/jre"
export SPARK_HOME="$RUNTIME_DIR/spark"
export HADOOP_HOME="$RUNTIME_DIR/hadoop"
export PATH="$PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$SPARK_HOME/bin:$HADOOP_CONF_DIR:$PATH"
export SPARK_DIST_CLASSPATH=$(hadoop classpath)

echo "Worker: $HOSTNAME Connected to spark://$MASTER_HOSTNAME:$MASTER_PORT --webui-port $WORKER_WEBUI_PORT" 

# Starting the Spark Worker 
$SPARK_HOME/sbin/../bin/spark-class org.apache.spark.deploy.worker.Worker spark://$MASTER_HOSTNAME:$MASTER_PORT --webui-port $WORKER_WEBUI_PORT 

