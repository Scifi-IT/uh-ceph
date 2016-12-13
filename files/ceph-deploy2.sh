#!/bin/bash

cd my-cluster
ceph-deploy osd prepare node1:/var/local/osd0 node2:/var/local/osd1 node3:/var/local/osd2
ceph-deploy osd activate node1:/var/local/osd0 node2:/var/local/osd1 node3:/var/local/osd2
ceph-deploy admin admin node1 node2 node3
sudo chmod +r /etc/ceph/ceph.client.admin.keyring
exit 0
