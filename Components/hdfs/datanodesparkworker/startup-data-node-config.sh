#!/usr/bin/env bash

export RUNTIME_DIR=/BDaaS/dependencies
export JAVA_HOME="$RUNTIME_DIR/jre"
export SPARK_HOME="$RUNTIME_DIR/spark"
export HADOOP_HOME="$RUNTIME_DIR/hadoop"
export PATH="$PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$SPARK_HOME/bin:$HADOOP_CONF_DIR:$PATH"

#export SPARK_DIST_CLASSPATH=$(/eslap/legacy/hadoop/bin/hadoop classpath):/eslap/legacy/hadoop/share/hadoop/tools/lib/*' >> packages/spark/conf/spark-env.sh
####
export SPARK_DIST_CLASSPATH=$(hadoop classpath)
###

# Set up the core-site Xml

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<?xml-stylesheet type=\"text/xsl\" href=\"configuration.xsl\"?>
<configuration>
    <property><name>fs.defaultFS</name><value>hdfs://$NAMENODE_HOSTNAME:$NAMENODE_METADATA_PORT</value></property>
    <property><name>hadoop.http.staticuser.user</name><value>root</value></property>
</configuration>" > $HADOOP_HOME/etc/hadoop/core-site.xml


# Set path for the HDFS

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<?xml-stylesheet type=\"text/xsl\" href=\"configuration.xsl\"?>
<configuration> 
  <property><name>dfs.permissions.enabled</name><value>false</value></property>
  <property><name>dfs.client.use.datanode.hostname</name><value>false</value></property>
  <property><name>dfs.datanode.use.datanode.hostname</name><value>false</value></property>

  <property><name>dfs.namenode.name.dir</name><value>$HADOOP_HOME/data/nameNode</value></property>
  <property><name>dfs.namenode.http-adress</name><value>$NAMENODE_HOSTNAME:$NAMENODE_WEBUI_PORT</value></property>
  
  <property><name>dfs.datanode.data.dir</name><value>$HADOOP_HOME/data/dataNode</value></property>
  <property><name>dfs.datanode.http.address</name><value>$HOSTNAME:$DATANODE_WEBUI_PORT</value></property>

  <property> <name>dfs.replication</name> <value>$REPLI_FACTOR</value></property>
  <property> <name>dfs.webhdfs.enabled</name><value>true</value></property>
</configuration>" > $HADOOP_HOME/etc/hadoop/hdfs-site.xml

echo "Datanode"
# Start Datanode
hdfs datanode &


echo "Worker: $HOSTNAME Connected to spark://$MASTER_HOSTNAME:$MASTER_PORT --webui-port $MASTER_WEBUI_PORT" 

# Starting the Spark Worker 
$SPARK_HOME/sbin/../bin/spark-class org.apache.spark.deploy.worker.Worker spark://$MASTER_HOSTNAME:$MASTER_PORT --webui-port $WORKER_WEBUI_PORT 