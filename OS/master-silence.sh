#!/bin/bash

# A heuristic script that check for black-out.

# Now this is applied to 3 masters (133,134,135)
# as a cron job.
# once every 15 mins

for ((i=100;i<=132;i++))
do
  ping -c 4 10.1.0.$i >> /dev/null
  switch1=$?
  ping -c 4 10.2.0.$i >> /dev/null
  switch2=$?
  if [ "$switch1" == 0 -o "$switch2" == 0 ] ; then
     echo "alive" 
     exit
  else
     echo "$i down" 
  fi
done

echo "died"
shutdown now
