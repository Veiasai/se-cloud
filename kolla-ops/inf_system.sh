users=()
passwds=()
num=0

source ./project.sh
source ./user.sh
source ./quota.sh

for ((i=0;i<num;i++))
do
project_create ${users[$i]}
quota_set ${users[$i]}
user_create ${users[$i]} ${users[$i]} ${passwds[$i]} 
openstack role add --project ${users[$i]} --user ${users[$i]} _member_
done