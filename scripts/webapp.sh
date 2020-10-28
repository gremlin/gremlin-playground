#!/bin/bash

# Install Redis
yum install -y redis
systemctl enable redis

# Install Python
yum install -y python36

# Install Pip requirements
python3 -m pip install redis Flask

# Add the webapp as a service and start on boot
mv /tmp/webapp.service /lib/systemd/system/webapp.service
systemctl enable webapp.service
