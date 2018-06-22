import tensorflow as tf
import os
import json
JOB = os.environ.get('JOB')
TASK = int(os.environ.get('TASK'))

def main():
    with open('cluster_spec.json','r') as f:
        cluster_spec=json.load(f)
        cluster=tf.train.ClusterSpec(cluster_spec)
    
    server = tf.train.Server(cluster, job_name=JOB, task_index=TASK)
    


    if JOB == "ps":
        server.join()
    elif JOB == "worker":

        # Assigns ops to the local worker by default.
        with tf.device(tf.train.replica_device_setter(
            worker_device="/job:worker/task:"+str(TASK),
            cluster=cluster)):

            # Build model...

            x = tf.constant([[1], [2], [3], [4]], dtype=tf.float32)
            y_true = tf.constant([[0], [-1], [-2], [-3]], dtype=tf.float32)

            linear_model = tf.layers.Dense(units=1)

            y_pred = linear_model(x)

            loss = tf.losses.mean_squared_error(labels=y_true, predictions=y_pred)

            global_step = tf.contrib.framework.get_or_create_global_step()

            train_op = tf.train.AdagradOptimizer(0.01).minimize(
                loss, global_step=global_step)

        # The StopAtStepHook handles stopping after running given steps.
        hooks=[tf.train.StopAtStepHook(last_step=1000000)]

        # The MonitoredTrainingSession takes care of session initialization,
        # restoring from a checkpoint, saving to a checkpoint, and closing when done
        # or an error occurs.
        with tf.train.MonitoredTrainingSession(master=server.target,
                                            is_chief=(TASK == 0),
                                            checkpoint_dir="/tmp/train_logs",
                                            hooks=hooks) as mon_sess:

            while not mon_sess.should_stop():
                # Run a training step asynchronously.
                # See <a href="../api_docs/python/tf/train/SyncReplicasOptimizer"><code>tf.train.SyncReplicasOptimizer</code></a> for additional details on how to
                # perform *synchronous* training.
                # mon_sess.run handles AbortedError in case of preempted PS.
                mon_sess.run(train_op)


if __name__ == "__main__":
    tf.app.run(main)
