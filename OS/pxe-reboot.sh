#!/bin/bash

for ((i=113;i<=114;i++))
do
    sshpass -p calvin ssh -o StrictHostKeyChecking=no root@192.168.0.$i "racadm config -g cfgServerInfo -o cfgServerBootOnce 1"
    sshpass -p calvin ssh -o StrictHostKeyChecking=no root@192.168.0.$i "racadm config -g cfgServerInfo -o cfgServerFirstBootDevice PXE"
    sshpass -p calvin ssh -o StrictHostKeyChecking=no root@192.168.0.$i "racadm serveraction powercycle"
done