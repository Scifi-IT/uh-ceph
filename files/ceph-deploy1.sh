#!/bin/bash

cd my-cluster
ceph-deploy new node1 node2 node3
echo "osd pool default size = 2" >> ceph.conf
ceph-deploy install admin node1 node2 node3
ceph-deploy mon create-initial
exit 0
