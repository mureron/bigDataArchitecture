#!/usr/bin/env bash

#source activate py3
/BDaaS/dependencies/miniconda/bin/jupyter notebook --allow-root --ip $(hostname) --port 8800 --no-browser --config=/BDaaS/dependencies/miniconda/bin/jupyter_notebook_config.py

