#!/bin/bash

# Install iproute-tc, Gremlin requires this for network attacks
yum install -y iproute-tc

# Add the Gremlin repo
curl https://rpm.gremlin.com/gremlin.repo -o /etc/yum.repos.d/gremlin.repo
# Install Gremlin client and daemon
yum install -y gremlin gremlind

# Move MOTD into place
mv /tmp/motd /etc/motd

# Move helper commands into run path
chmod 755 /tmp/commands/*
mv /tmp/commands/* /usr/bin/
