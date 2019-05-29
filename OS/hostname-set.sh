for ((i=109;i<=111;i++))
do
    ssh -o StrictHostKeyChecking=no root@10.1.0.$i "hostnamectl set-hostname node-$i"
done
