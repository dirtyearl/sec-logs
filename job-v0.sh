# Create an attachable bridge network for the containers
docker network create -d bridge --attachable sec-net

# Start the redis server container and forward the the default port 6379
docker run --name sec-redis -p 6379:6379 -d --network sec-net redis

# Run the python script that creates the list of files and pushes them into the
# redis database
python3 create-list/create-list-v1.py --url "https://www.sec.gov/files/EDGAR_LogFileData_thru_Jun2017.html"

# Download the individual file and save to a temporary location for further
# processing. Eventually this should be a GCP, Azure, or AWS location.
python3 transfer-job/transfer-job-v1.1.py

# Stop and delete the container running the redis server
docker stop sec-redis
docker rm sec-redis