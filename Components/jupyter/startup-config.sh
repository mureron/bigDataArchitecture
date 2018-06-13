#!/usr/bin/env bash

echo "c = get_config()
c.NotebookApp.notebook_dir = '/data/jupyter/'
c.NotebookApp.password_required = False
c.NotebookApp.token = ''
c.NotebookApp.allow_origin = '*'
c.NotebookApp.tornado_settings = {'headers': { 'Content-Security-Policy': \"frame-ancestors  'self' *\" }}" > /eslap/legacy/miniconda/bin/jupyter_notebook_config.py


/eslap/legacy/miniconda/bin/jupyter notebook --allow-root --ip $(hostname) --port 8800 --no-browser --config=/eslap/legacy/miniconda/bin/jupyter_notebook_config.py

