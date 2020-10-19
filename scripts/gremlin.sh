#!/bin/bash

# Add the Gremlin repo
curl https://rpm.gremlin.com/gremlin.repo -o /etc/yum.repos.d/gremlin.repo
# Install Gremlin client and daemon
yum install -y gremlin gremlind

mv /tmp/motd /etc/motd
mv /tmp/gremlin-playground /usr/bin/gremlin-playground
chmod 755 /usr/bin/gremlin-playground
