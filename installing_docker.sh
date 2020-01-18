echo "update"
sudo apt-get update -y
echo "install a few prerequisite packages which let apt use packages over HTTPS:"
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
echo "add the GPG key for the official Docker repository to your system"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo "Add the Docker repository to APT sources:"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
echo "update the package database with the Docker packages from the newly added repo:"
sudo apt-get update -y
echo "Make sure you are about to install from the Docker repo instead of the default Ubuntu repo"
apt-cache policy docker-ce
echo "installing docker"
sudo apt-get install docker-ce -y
echo "updating required packages"
bash required_package.sh
