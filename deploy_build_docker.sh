#!/bin/bash

echo "----------------------Stopping container------------------------"
docker stop $(docker ps -aq)
echo "-------------------------removing containers--------------------"
docker rm $(docker ps -aq)
echo "----------------------------building docker---------------------"
sudo docker build -t projectimage:$BUILD_NUMBER .
echo "----------------------running container-------------------------"
sudo docker run -itd -p 5000:80 --name project-container projectimage:$BUILD_NUMBER
