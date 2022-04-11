#/bin/bash

# install Docker
#sudo apt-get update
#sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
echo "Installing Docker"
sudo apt-get update
sudo apt-get install -y docker-ce
echo "Docker installed"

# start Docker
sudo service docker start
echo "Docker started"

# set up Neo4j environment in docker
echo "Setting up Neo4j environment in docker..."
docker run --name neo4j -p 7474:7474 -p 7687:7687 --env NEO4J_AUTH=neo4j/securepw neo4j:latest
echo "done"

# load dataset from https://www.kaggle.com/datasets/shivamb/netflix-shows
echo "Downloading dataset from https://www.kaggle.com/datasets/shivamb/netflix-shows"
wget https://www.kaggle.com/datasets/shivamb/netflix-shows/netflix-shows.zip
unzip netflix-shows.zip
rm netflix-shows.zip
echo "done"

ls