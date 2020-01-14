echo "installing wget"
sudo apt-get install wget

echo "getting puppet relase"
wget https://apt.puppet.com/puppet6-release-bionic.deb

echo "unpacking deb package"
sudo dpkg -i puppet6-release-bionic.deb

echo "update packages"
sudo apt-get update

echo "installing puppet"
sudo apt-get install puppet -y

echo "Inserting into hosts file"
cat <<EOT>> /etc/hosts
192.168.0.109 puppet project.edu.com
192.168.0.120 puppetslave
EOT

echo "inserting into config file"
cat <<EOT>> /etc/puppet/puppet.conf
[main]
server = project.edu.com
EOT

find /var/lib/puppet/ssl -name vagrant.vm.pem -delete

echo "starting puppet agent"
sudo systemctl restart puppet.service

echo "enabling puppet agent"
sudo systemctl enable puppet

