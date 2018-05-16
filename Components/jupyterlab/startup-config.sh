#!/usr/bin/env bash

export RUNTIME_DIR=/BDaaS/dependencies
export SPARK_HOME="$RUNTIME_DIR/spark"
export PATH="$PATH:$SPARK_HOME/bin"
export JUPYTERPATH=/BDaaS/dependencies/miniconda/bin

echo "c = get_config()
c.NotebookApp.notebook_dir = '/data/jupyter/'
c.NotebookApp.password_required = False
c.NotebookApp.token = ''
c.NotebookApp.allow_origin = '*'
c.NotebookApp.tornado_settings = {'headers': { 'Content-Security-Policy': \"frame-ancestors  'self' *\" }}" > $JUPYTERPATH/jupyter_notebook_config.py

 echo "Jupyter Mode $STANDALONE"

if [[ $STANDALONE = "YES" ]];
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
