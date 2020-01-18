#!/bin/bash
. /etc/profile.d/puppet-agent.sh
sudo systemctl restart puppetserver.service
sudo systemctl enable puppetserver.service
sudo /opt/puppetlabs/bin/puppetserver ca list
sudo /opt/puppetlabs/bin/puppetserver ca sign --all
