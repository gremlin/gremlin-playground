#!/bin/bash

# Add the Gremlin repo
sudo curl https://rpm.gremlin.com/gremlin.repo -o /etc/yum.repos.d/gremlin.repo
# Install Gremlin client and daemon
sudo yum install -y gremlin gremlind
