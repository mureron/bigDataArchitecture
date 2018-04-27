#!/usr/bin/env bash
echo "c = get_config()

c.Authenticator.whitelist = {'rmuresano', 'lmontes', 'egil'}
c.Authenticator.admin_users = {'rmuresano'}
c.LocalAuthenticator.create_system_users = True
c.JupyterHub.admin_access = True
c.PAMAuthenticator.open_sessions = False" > /BDaaS/dependencies/miniconda/bin/jupyterhub_config.py



sed -i "s/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/" /etc/pam.d/login

/etc/init.d/ssh start &
jupyterhub --ip $(hostname) --port 9000 -f /BDaaS/dependencies/miniconda/bin/jupyterhub_config.py
