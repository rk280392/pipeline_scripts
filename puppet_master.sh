#!/bin/bash
. /etc/profile.d/puppet-agent.sh
sudo systemctl restart puppetserver.service
sudo systemctl enable puppetserver.service
checkcert="$(sudo /opt/puppetlabs/bin/puppetserver ca list --all | grep Requested)"
if [[ $checkcert ]]
then
	sudo /opt/puppetlabs/bin/puppetserver ca sign --all
else
	"-----all certs updated -----------"
fi
