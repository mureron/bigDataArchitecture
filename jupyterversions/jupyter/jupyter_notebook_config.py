c = get_config()
c.NotebookApp.notebook_dir = '/BDaaS/volumen/data'
c.NotebookApp.password_required = False
c.NotebookApp.token = ''
c.NotebookApp.allow_origin = '*'
c.NotebookApp.tornado_settings = {'headers': { 'Content-Security-Policy': "frame-ancestors  'self' *" }}

