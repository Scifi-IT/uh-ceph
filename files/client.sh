#!/bin/bash
sudo chmod +r /etc/ceph/ceph.client.admin.keyring 
rbd create foo --image-feature layering --size 4096 
sudo rbd map foo --name client.admin
sudo mkfs.ext4 -m0 /dev/rbd/rbd/foo
sudo mkdir /mnt/ceph-block-device
sudo sh -c "echo /dev/rbd/rbd/foo /mnt/ceph-block-device ext4 defaults 0 2 >> /etc/fstab"
sudo mount -a
exit 0
