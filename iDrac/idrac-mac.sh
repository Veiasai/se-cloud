#!/bin/bash

# Gather the NIC information by racadm.

for ((i=118;i<=118;i++))
do
    sshpass -p calvin ssh -o StrictHostKeyChecking=no root@192.168.0.$i "racadm racdump" | grep NIC. | sed "s/^/$i /g" >> mac-cloud
done