mycmd="$(docker -v)"
if [[ ! $mycmd ]]
then
	echo "update"
	sudo apt-get update -y
	echo "install a few prerequisite packages which let apt use packages over HTTPS:"
	sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
	echo "add the GPG key for the official Docker repository to your system"
	sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - >&/dev/null
	echo "Add the Docker repository to APT sources:"
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
	echo "update the package database with the Docker packages from the newly added repo:"
	sudo apt-get update -y
	echo "Make sure you are about to install from the Docker repo instead of the default Ubuntu repo"
	sudo apt-cache policy docker-ce
	echo "installing docker"
	sudo apt-get install docker-ce -y
	sudo usermod -a -G docker jenkins
	sudo setfacl -m user:jenkins:rw /var/run/docker.sock
	sudo newgrp docker
else
	echo "-------- docker was already installed-------------"
fi
echo "updating required packages"
sudo bash required_package.sh
