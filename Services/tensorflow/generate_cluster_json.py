import json
import re
with open('docker-compose.yml','r') as f:
    yaml=f.read()
cluster={}
for hostname in re.findall(r'(?<=hostname: )\S+',yaml):
    if 'master' in hostname:
        job='master'
    elif 'ps' in hostname:
        job='ps'
    else:
        job='worker'
    if job in cluster.keys():
        cluster[job].append(hostname+':2222')
    else:
        cluster[job]=[hostname+':2222']

with open('cluster.json','w') as f:
    json.dump(cluster,f)

    
    
