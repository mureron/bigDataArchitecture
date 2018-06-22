#!/usr/bin/env bash

export RUNTIME_DIR=/eslap/legacy
export JUPYTERPATH=$RUNTIME_DIR/miniconda/bin
export SPARK_HOME="$RUNTIME_DIR/spark"
export HADOOP_HOME="$RUNTIME_DIR/hadoop"
export PATH="$PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$SPARK_HOME/bin:$PATH"
export SPARK_DIST_CLASSPATH=$(hadoop classpath)


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
