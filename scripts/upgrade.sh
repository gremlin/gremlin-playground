#!/bin/bash

# Upgrade the kernel
dnf install -y kernel kernel-modules-extra
shutdown -r now
