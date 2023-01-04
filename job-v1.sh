# Create an attachable bridge network for the containers. Turns out that is
# doesn't work with redis.
#docker network create -d bridge --attachable sec-net

# Create a volume to store output
docker volume create sec-vol

# Start the redis server container and forward the the default port 6379
docker run --rm --name sec-redis -itd --network host -h redis -p 6379:6379 redis
docker run --rm --name create-list -itd --network host create-list:1.0
#docker run --rm --name transfer-job --mount source=sec-vol,target=/log-files --network host transfer-job:1.1
docker run --rm --name transfer-job --mount type=bind,source=/c/Users/edavis67/OneDrive\ -\ DXC\ Production/sec-logs/,target=/log-files --network host transfer-job:1.1

# Stop and delete the container running the redis server
docker container stop sec-redis
#docker container stop create-list
#docker container stop transfer-job
#docker container rm sec-redis
#docker container rm create-list
#docker container rm transfer-job

docker run --rm -it --mount source=sec-vol,target=/log-files busybox find /log-files
#docker volume rm sec-vol
