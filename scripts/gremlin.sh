#!/bin/bash

# Add the Gremlin repo
curl https://rpm.gremlin.com/gremlin.repo -o /etc/yum.repos.d/gremlin.repo
# Install Gremlin client and daemon
yum install -y gremlin gremlind

# Install tools to help see the effect of attacks
yum install -y sysstat

# Move MOTD into place
mv /tmp/motd /etc/motd

# Move helper commands into run path
chmod 755 /tmp/commands/*
mv /tmp/commands/* /usr/bin/
