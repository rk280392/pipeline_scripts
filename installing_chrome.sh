#!/bin/bash

chromedriver_version="$(chromedriver --version)"
if [[ ! $chromedriver_version ]]
then
	sudo apt-get install libnss -y*
	sudo apt-get install libnss3 -y*
	sudo apt-get install libX11 -y*
	echo "Clean up existing files"
	sudo rm -rf /usr/local/share/chromedriver
	sudo rm -rf /usr/local/bin/chromedriver
	sudo rm -rf /usr/bin/chromedriver
	echo "-------Installing unzip--------"
	sudo apt-get install unzip
	echo "-------Fetching chromedriver--------"
	wget -N https://chromedriver.storage.googleapis.com/79.0.3945.36/chromedriver_linux64.zip
	echo "------unzipping chromedriver--------"
	unzip chromedriver_linux64.zip
	echo "-------Putttng execute permission of chromedriver---------"
	chmod +x chromedriver
	echo "-------moving chromer driver to /usr/local/share/----------"
	sudo mv -f chromedriver /usr/local/share/chromedriver
	echo "-------Creating softlink in /usr/bin and /usr/local/bin------"
	sudo ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
	sudo ln -s /usr/local/share/chromedriver /usr/bin/chromedriver
else
	echo "chromedriver version $chromedriver_version is alreay installed"
fi
selenium_version="$(python -c 'import selenium; print(selenium.__version__)')"
if [[ ! $selenium_version ]]
then
	echo "*****************Installing python pip*****************"
	sudo apt-get install python-pip -y
	echo "*****************Installing selenium*******************"
	pip install selenium
	echo "$selenium_version"
else
	echo "********************Selenium was already installed************* version \"$selenium_version\""
fi

