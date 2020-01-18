sudo apt-get update
sudo apt-get install -y unzip xvfb libxi6 libgconf-2-4
sudo apt-get install python-pip -y
sudo curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add
sudo echo "deb [arch=amd64]  http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
sudo apt-get -y update
sudo apt-get -y install google-chrome-stable
wget https://chromedriver.storage.googleapis.com/79.0.3945.36/chromedriver_linux64.zip
unzip chromedriver_linux64.zip 
sudo mv chromedriver /usr/bin/
sudo chown root:root /usr/bin/chromedriver 
sudo chmod +x /usr/bin/chromedriver 
sudo pip install selenium
sudo apt-get install -y python-pytest
