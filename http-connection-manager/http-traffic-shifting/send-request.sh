#!/bin/bash
declare -i ver15=0
declare -i ver16=0

interval="0.2"

while true; do
	if curl -s http://$1/service/myapp | grep "v1.5" &> /dev/null; then
		# $1 is the host address of the front-envoy.
		ver15=$[$ver15+1]
	else
		ver16=$[$ver16+1]
	fi
	echo "myapp-v1.5:myapp-v1.6 = $ver15:$ver16"
	sleep $interval
done
