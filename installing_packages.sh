#!/bin/bash

for name in `cat packages.txt`
do
	dpkg -s $name &> /dev/null
	case $name in
		wget)
			if [ $? -ne 0 ]
			then
				echo "not installed"
				sudo apt-get update
				sudo apt-get install $name
			else
				echo    "***********$name was installed*******************"
			fi
			;;
		puppet)
			if [ $? -ne 0 ]
			then
				echo "installing puppet agent"
				echo "getting puppet relase"
				wget https://apt.puppet.com/puppet6-release-bionic.deb
				echo "unpacking deb package"
				sudo dpkg -i puppet6-release-bionic.deb
				echo "update packages"
				sudo apt-get update
				echo "installing puppet"
				sudo apt-get install puppet -y
			else
				echo    "***********$name was installed*******************"
			fi
			;;
		ansible)
			if [ $? -ne 0 ]
			then
				echo "installing ansible"
				sudo apt update -y
				sudo apt install software-properties-common
				sudo apt-add-repository --yes --update ppa:ansible/ansible
				sudo apt install ansible -y
			else
				echo    "***********$name was installed*******************"
			fi
			;;
		*)
			echo "no packages to install"
	esac
done
