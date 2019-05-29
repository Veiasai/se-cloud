file=/etc/sysconfig/network-scripts/ifcfg-em1
passwd=x

for ((i=204;i<=255;i++))
do
    echo $i
    num=$(sshpass -p $passwd ssh -o StrictHostKeyChecking=no root@192.168.2.$i "ip addr | grep -n em3: | awk -F ':' '{print \$1}'")
    if (! test $num)
    then
        echo conti
        continue
    fi
    num=$(($num+1))
    mac=$(sshpass -p $passwd ssh -o StrictHostKeyChecking=no root@192.168.2.$i "ip addr | sed -n '${num}p' | grep -P '([a-fA-F0-9]{2}:){5}[a-fA-F0-9]{2}' -o | sed -n '1p'")
    ip=$(grep -i $mac ./mac-cloud | awk -F ' ' '{print $1}')
    echo "$ip begin"
    sshpass -p $passwd ssh -o StrictHostKeyChecking=no root@192.168.2.$i "sed -i '/ONBOOT=/c'"ONBOOT=yes" $file"
    sshpass -p $passwd ssh -o StrictHostKeyChecking=no root@192.168.2.$i "sed -i '/BOOTPROTO=/c'"BOOTPROTO=static" $file"

    sshpass -p $passwd ssh -o StrictHostKeyChecking=no root@192.168.2.$i "[[ \`grep IPADDR $file\` ]] || echo \"IPADDR=10.1.0.$ip\" >> $file"
    sshpass -p $passwd ssh -o StrictHostKeyChecking=no root@192.168.2.$i "[[ \`grep PREFIX $file\` ]] || echo \"PREFIX=16\" >> $file"
    sshpass -p $passwd ssh -o StrictHostKeyChecking=no root@192.168.2.$i "[[ \`grep GATEWAY $file\` ]] || echo \"GATEWAY=10.1.0.1\" >> $file"
    sshpass -p $passwd ssh -o StrictHostKeyChecking=no root@192.168.2.$i "[[ \`grep DNS1 $file\` ]] || echo \"DNS1=202.120.2.101\" >> $file"

    sshpass -p $passwd ssh -o StrictHostKeyChecking=no root@192.168.2.$i "ifdown em1"
    sshpass -p $passwd ssh -o StrictHostKeyChecking=no root@192.168.2.$i "ifup em1"

    echo "$ip end"
done

