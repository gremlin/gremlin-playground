#!/bin/bash

# Remove the old kernel
dnf remove -y --oldinstallonly --setopt installonly_limit=1 kernel
