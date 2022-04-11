#/bin/bash

# start Docker
sudo service docker start
echo "Docker started"

# set up Neo4j environment in docker
echo "Setting up Neo4j environment in docker..."
docker run -d --log-driver=none --name neo4j -p 7474:7474 -p 7687:7687 --env NEO4J_AUTH=neo4j/securepw neo4j:latest
echo "done"

# load dataset from https://www.kaggle.com/datasets/shivamb/netflix-shows
echo "Downloading dataset from https://www.kaggle.com/datasets/shivamb/netflix-shows"
wget https://www.kaggle.com/datasets/shivamb/netflix-shows/download
unzip archive.zip
rm archive.zip
echo "done"