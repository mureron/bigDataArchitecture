cd ../Services/tensorflow
python generate_cluster_json.py
for container in $(docker ps -q)
do docker cp cluster.json $container:/eslap/legacy/cluster.json
done
