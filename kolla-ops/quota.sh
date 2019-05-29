function quota_set {
openstack quota set \
    --cores 16 \
    --floating-ips 1 \
    --instances 4\
    --ram 65536 \
    --routers 0 \
    --networks 0 \
    --subnets 0 \
    --secgroup-rules 100 \
    --key-pairs 10 \
    $1
}

