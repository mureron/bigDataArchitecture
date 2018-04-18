#!/usr/bin/env bash

#source activate py3
pip install jupyterlab_plotly && \
    # For JupyterLab
jupyter labextension install --symlink --py --sys-prefix jupyterlab_plotly 
jupyter labextension enable --py --sys-prefix jupyterlab_plotly 

/BDaaS/dependencies/miniconda/bin/jupyter-lab --allow-root --ip $(hostname) --port 8900 --no-browser --config=/BDaaS/dependencies/miniconda/bin/jupyter_notebook_config.py

