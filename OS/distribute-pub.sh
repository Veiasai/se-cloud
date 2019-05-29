for ((i=109;i<=111;i++))
do
    sshpass -p incongruous ssh -o StrictHostKeyChecking=no root@10.1.0.$i "mkdir /root/.ssh; chmod 700 /root/.ssh;"
    sshpass -p incongruous scp -o StrictHostKeyChecking=no /root/.ssh/authorized_keys root@10.1.0.$i:/root/.ssh
    sshpass -p incongruous ssh -o StrictHostKeyChecking=no root@10.1.0.$i "chmod 600 /root/.ssh/authorized_keys"
done
