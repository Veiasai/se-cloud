function user_create {
openstack user create \
    --project $1 \
    --password $3 \
    --enable \
    $2
}

