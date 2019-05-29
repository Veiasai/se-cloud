function project_create {
    echo "create proj $1 in default"
    openstack project create --enable $1
}

