for ((i=134;i<=135;i++))
do
    ssh -o StrictHostKeyChecking=no root@10.1.0.$i "systemctl stop docker; mkdir /home/lib; mv /var/lib/docker /home/lib; ln -s /home/lib/docker /var/lib/docker;"
done
