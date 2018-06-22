#!/usr/bin/env bash


export RUNTIME_DIR=/eslap/legacy
export JAVA_HOME="$RUNTIME_DIR/jre"
export SPARK_HOME="$RUNTIME_DIR/spark"
export HADOOP_HOME="$RUNTIME_DIR/hadoop"
export PATH="$PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$SPARK_HOME/bin:$HADOOP_CONF_DIR:$PATH"

export SPARK_DIST_CLASSPATH=$(hadoop classpath)
# Start spark master and worker services

echo "$SPARK_HOME/sbin/start-master.sh -h $HOSTNAME -p $MASTER_PORT --webui-port $MASTER_WEBUI_PORT" 

$SPARK_HOME/sbin/../bin/spark-class org.apache.spark.deploy.master.Master -h $HOSTNAME -p $MASTER_PORT --webui-port $MASTER_WEBUI_PORT

