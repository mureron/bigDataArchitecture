c = get_config()

c.Authenticator.whitelist = {'rmuresano', 'lmontes', 'egil'}
c.Authenticator.admin_users = {'rmuresano'}
c.LocalAuthenticator.create_system_users = True
c.JupyterHub.admin_access = True
c.PAMAuthenticator.open_sessions = False
