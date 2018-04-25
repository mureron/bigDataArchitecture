#!/usr/bin/env bash

sed -i "s/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/" /etc/pam.d/login

/etc/init.d/ssh start &
jupyterhub --ip $(hostname) --port 9000 -f /BDaaS/dependencies/miniconda/bin/jupyterhub_config.py
