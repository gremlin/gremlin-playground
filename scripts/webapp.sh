#!/bin/bash

# Install Redis
yum install -y redis

# Install Python
yum install -y python

# Install Pip requirements
pip install -r /home/gremlin/webapp/requirements.txt 
