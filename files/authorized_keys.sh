#!/bin/bash
if [ ! -d $HOME/.ssh ]; then
    mkdir $HOME/.ssh
fi
echo $1 > $HOME/.ssh/authorized_keys
exit 0
