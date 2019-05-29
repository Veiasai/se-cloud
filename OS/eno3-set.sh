file=/etc/sysconfig/network-scripts/ifcfg-eno3

for ((i=109;i<=111;i++))
do
    ssh -o StrictHostKeyChecking=no root@10.1.0.$i "sed -i '/BOOTPROTO=/c'"BOOTPROTO=static" $file"
    ssh -o StrictHostKeyChecking=no root@10.1.0.$i "[[ \`grep IPADDR $file\` ]] || echo \"IPADDR=192.168.2.$i\" >> $file" 
    ssh -o StrictHostKeyChecking=no root@10.1.0.$i "[[ \`grep PREFIX $file\` ]] || echo \"PREFIX=16\" >> $file" 
    ssh -o StrictHostKeyChecking=no root@10.1.0.$i "[[ \`grep GATEWAY $file\` ]] || echo \"GATEWAY=192.168.2.1\" >> $file" 
    ssh -o StrictHostKeyChecking=no root@10.1.0.$i "[[ \`grep DNS1 $file\` ]] || echo \"DNS1=202.120.2.101\" >> $file" 
    ssh -o StrictHostKeyChecking=no root@10.1.0.$i "ifdown eno3; ifup eno3;"
done
