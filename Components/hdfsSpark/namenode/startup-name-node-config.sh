#!/usr/bin/env bash

export RUNTIME_DIR=/BDaaS/dependencies
export JAVA_HOME="$RUNTIME_DIR/jre"
export HADOOP_HOME="$RUNTIME_DIR/hadoop"
export PATH="$PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH"

# Set up the core-site Xml

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<?xml-stylesheet type=\"text/xsl\" href=\"configuration.xsl\"?>
<configuration>
    <property><name>fs.defaultFS</name><value>hdfs://$HOSTNAME:$NAMENODE_METADATA_PORT</value></property>
    <property><name>hadoop.http.staticuser.user</name><value>root</value></property>
</configuration>" > $HADOOP_HOME/etc/hadoop/core-site.xml


# Set path for the HDFS

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<?xml-stylesheet type=\"text/xsl\" href=\"configuration.xsl\"?>
<configuration> 
  <property><name>dfs.webhdfs.enabled</name><value>true</value></property>
  <property><name>dfs.permissions.enabled</name><value>false</value></property>
  <property><name>dfs.client.use.datanode.hostname</name><value>false</value></property>
  <property><name>dfs.datanode.use.datanode.hostname</name><value>false</value></property>

  <property><name>dfs.namenode.name.dir</name><value>$HADOOP_HOME/data/nameNode</value></property>
  <property><name>dfs.namenode.checkpoint.dir</name><value>$HADOOP_HOME/data/secondary</value></property>
  <property><name>dfs.namenode.http-adress</name><value>$HOSTNAME:$NAMENODE_WEBUI_PORT</value></property>
  <property><name>dfs.namenode.datanode.registration.ip-hostname-check</name><value>false</value></property>

  <property> <name>dfs.replication</name> <value>$REPLI_FACTOR</value></property>

  <property> <name>dfs.webhdfs.enabled</name><value>true</value></property>
  
</configuration>" > $HADOOP_HOME/etc/hadoop/hdfs-site.xml

echo "Namenode"
hdfs namenode -format $CLUSTER_NAME

hdfs namenode

# Wait for HDFS services to be up and running
sleep 5

# Create a tmp directory and make it accessible to everyone
hadoop fs -mkdir -p /tmp
hadoop fs -chmod -R 777 /tmp

while true; do
  sleep 100;
done