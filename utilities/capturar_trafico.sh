for container in $(docker ps -q)
do docker exec $container netstat -anput > logs/$container.log
done

