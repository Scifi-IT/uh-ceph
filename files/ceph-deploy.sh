#!/bin/bash

DEPLOY_LOG=ceph-deploy-ceph.log

cd my-cluster
echo >> $DEPLOY_LOG
date >> $DEPLOY_LOG
echo "###############################################" >> $DEPLOY_LOG
echo "#           ceph-deploy new node1             #" >> $DEPLOY_LOG
echo "###############################################" >> $DEPLOY_LOG
ceph-deploy new node1

echo "osd pool default size = 2" >> ceph.conf

echo >> $DEPLOY_LOG
date >> $DEPLOY_LOG
echo "###############################################" >> $DEPLOY_LOG
echo "# ceph-deploy install admin node1 node2 node3 #" >> $DEPLOY_LOG
echo "###############################################" >> $DEPLOY_LOG
ceph-deploy install admin node1 node2 node3

echo >> $DEPLOY_LOG
date >> $DEPLOY_LOG
echo "###############################################" >> $DEPLOY_LOG
echo "#        ceph-deploy mon create-initial       #" >> $DEPLOY_LOG
echo "###############################################" >> $DEPLOY_LOG
ceph-deploy mon create-initial

echo >> $DEPLOY_LOG
date >> $DEPLOY_LOG
echo "###############################################" >> $DEPLOY_LOG
echo "# Creating /var/local/osdN dirs on nodes      #" >> $DEPLOY_LOG
echo "###############################################" >> $DEPLOY_LOG

ssh node1 "sudo mkdir /var/local/osd0"
ssh node1 "sudo chown ceph:ceph /var/local/osd0"
ssh node1 "sudo chcon system_u:object_r:var_t:s0 /var/local/osd0"

ssh node2 "sudo mkdir /var/local/osd1"
ssh node2 "sudo chown ceph:ceph /var/local/osd1"
ssh node2 "sudo chcon system_u:object_r:var_t:s0 /var/local/osd1"

ssh node3 "sudo mkdir /var/local/osd2"
ssh node3 "sudo chown ceph:ceph /var/local/osd2"
ssh node3 "sudo chcon system_u:object_r:var_t:s0 /var/local/osd2"

echo >> $DEPLOY_LOG
date >> $DEPLOY_LOG
echo "###############################################" >> $DEPLOY_LOG
echo "# ceph-deploy osd prepare  \                  #" >> $DEPLOY_LOG
echo "#    node1:/var/local/osd0 \                  #" >> $DEPLOY_LOG
echo "#    node2:/var/local/osd1 \                  #" >> $DEPLOY_LOG
echo "#    node3:/var/local/osd2                    #" >> $DEPLOY_LOG
echo "###############################################" >> $DEPLOY_LOG
ceph-deploy osd prepare node1:/var/local/osd0 node2:/var/local/osd1 node3:/var/local/osd2

echo >> $DEPLOY_LOG
date >> $DEPLOY_LOG
echo "###############################################" >> $DEPLOY_LOG
echo "# ceph-deploy osd activate \                  #" >> $DEPLOY_LOG
echo "#    node1:/var/local/osd0 \                  #" >> $DEPLOY_LOG
echo "#    node2:/var/local/osd1 \                  #" >> $DEPLOY_LOG
echo "#    node3:/var/local/osd2                    #" >> $DEPLOY_LOG
echo "###############################################" >> $DEPLOY_LOG
ceph-deploy osd activate node1:/var/local/osd0 node2:/var/local/osd1 node3:/var/local/osd2

echo >> $DEPLOY_LOG
date >> $DEPLOY_LOG
echo "###############################################" >> $DEPLOY_LOG
echo "# ceph-deploy admin admin node1 node2 node3   #" >> $DEPLOY_LOG
echo "###############################################" >> $DEPLOY_LOG
ceph-deploy admin admin node1 node2 node3

sudo chmod +r /etc/ceph/ceph.client.admin.keyring


echo >> $DEPLOY_LOG
date >> $DEPLOY_LOG
echo "###############################################" >> $DEPLOY_LOG
echo "#         ceph-deploy mon add node2           #" >> $DEPLOY_LOG
echo "###############################################" >> $DEPLOY_LOG
ceph-deploy mon add node2

echo >> $DEPLOY_LOG
date >> $DEPLOY_LOG
echo "###############################################" >> $DEPLOY_LOG
echo "#         ceph-deploy mon add node2           #" >> $DEPLOY_LOG
echo "###############################################" >> $DEPLOY_LOG
ceph-deploy mon add node3

echo >> $DEPLOY_LOG
date >> $DEPLOY_LOG
exit 0
