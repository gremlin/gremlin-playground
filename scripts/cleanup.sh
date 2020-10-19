#!/bin/bash

yum clean all

rm -rf /var/cache/* /usr/share/doc/*

# Zero out the rest of the free space using dd, then delete the written file.
echo "Writing zeroes to free space (this could take a while)."
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Add `sync` so Packer doesn't quit too early, before the large file is deleted.
sync
