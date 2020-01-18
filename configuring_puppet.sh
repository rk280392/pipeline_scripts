#!/bin/bash

cmd1="$(grep 'puppet' /etc/hosts | head -2)"
cmd2="$(grep 'project.edu.com' /etc/puppet/puppet.conf | head -1)"
ipaddress="$(ifconfig eth1 | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | head -1)"
hostnamectl set-hostname puppetslave
hostname1="$(cat /proc/sys/kernel/hostname)"

if [[ ! $cmd1  ]]
then
	echo "*******************Inserting into hosts file***********************"
	cat <<EOT>> /etc/hosts
	192.168.0.121 puppet project.edu.com
	$ipaddress $hostname1
EOT
echo "**************************updated hosts file******************************"
else
	echo "************************hosts file up to date******************************************"
fi

if [[ ! $cmd2 ]]
then
	echo "***************************inserting into config file********************************"
	cat <<EOT>> /etc/puppet/puppet.conf
	[main]
	server = project.edu.com
EOT
	echo "****************************updated puppet.conf****************************************"
else
	echo "****************************puppet.conf up to date****************************************"
fi

find /var/lib/puppet/ssl -name vagrant.vm.pem -delete

echo "starting puppet agent"
sudo systemctl restart puppet.service

echo "enabling puppet agent"
sudo systemctl enable puppet
