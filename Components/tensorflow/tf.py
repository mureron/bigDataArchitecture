import tensorflow as tf
import os
import json
import time
JOB = os.environ.get('JOB')
TASK = int(os.environ.get('TASK'))

if __name__ == "__main__":
    cluster=None
    while cluster==None:
        try:
            with open('cluster.json','r') as f:
                cluster=json.load(f)
                cluster_spec=tf.train.ClusterSpec(cluster)
        except:
            time.sleep(1)
    
    server = tf.train.Server(cluster_spec, job_name=JOB, task_index=TASK)
    
    server.join()
