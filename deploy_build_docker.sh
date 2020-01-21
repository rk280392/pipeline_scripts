#!/bin/bash

mycmd="$(sudo docker ps -aq)"
if [[ $mycmd ]]
then
	echo "----------------------Stopping container------------------------"
	sudo docker stop $(docker ps -aq)
	echo "-------------------------removing containers--------------------"
	sudo docker rm $(docker ps -aq)
	echo "----------------------------building docker---------------------"
	sudo docker build -t projectimage:$BUILD_NUMBER .
	echo "----------------------running container-------------------------"
	sudo docker run -itd -p 5000:80 --name project-container projectimage:$BUILD_NUMBER
else
	echo "-------------build ready----------------"
fi
