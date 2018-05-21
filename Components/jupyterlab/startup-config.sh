#!/usr/bin/env bash

export RUNTIME_DIR=/BDaaS/dependencies
export JUPYTERPATH=$RUNTIME_DIR/miniconda/bin
export SPARK_HOME="$RUNTIME_DIR/spark"
export HADOOP_HOME="$RUNTIME_DIR/hadoop"
export PATH="$PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$SPARK_HOME/bin:$PATH"



echo "c = get_config()
c.NotebookApp.notebook_dir = '/data/jupyter/'
c.NotebookApp.password_required = False
c.NotebookApp.token = ''
c.NotebookApp.allow_origin = '*'
c.NotebookApp.tornado_settings = {'headers': { 'Content-Security-Policy': \"frame-ancestors  'self' *\" }}" > $JUPYTERPATH/jupyter_notebook_config.py

 echo "Jupyter Mode $STANDALONE & HDFS $HDFS"

if  [[ $HDFS == "YES" ]]; 
then
       # Set up the core-site Xml
    echo "Set Up HDFS"
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
      <property><name>dfs.webhdfs.enabled</name><value>true</value></property>
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


    echo "Datanode On JupyterLab Node"
    # Start Datanode 
    hdfs datanode &
fi

if [[ $STANDALONE == "YES" ]];
then
    echo "Jupyter Mode STANDALONE"
    echo "Running Jupyter in StandAlone mode"
    echo "Jupyter Port  = $JUPYTERPORT"
    echo "Jupyter Path  = $JUPYTERPATH"
    echo "$JUPYTERPATH/jupyter-lab --allow-root --ip $(hostname) --port $JUPYTERPORT --no-browser --config=$JUPYTERPATH/jupyter_notebook_config.py"
    jupyter-lab --allow-root --ip=$(hostname) --port=$JUPYTERPORT --no-browser --config=$JUPYTERPATH/jupyter_notebook_config.py
else
    echo "Jupyter SPARK Mode DISTRIBUTED"
    export PYSPARK_DRIVER_PYTHON=$JUPYTERPATH/jupyter
	export PYSPARK_DRIVER_PYTHON_OPTS="lab --allow-root --ip $HOSTNAME --port $JUPYTERPORT --no-browser --config=$JUPYTERPATH/jupyter_notebook_config.py"
    
    echo "Launching jupyter"
	echo " spark --master spark://$MASTER_HOSTNAME:$MASTER_PORT >> /tmp/jupyter.log 2>&1 "
    pyspark --master spark://$MASTER_HOSTNAME:$MASTER_PORT  
fi
echo "Jupyter Lab Ready To use"
