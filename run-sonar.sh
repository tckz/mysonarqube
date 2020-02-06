#!/bin/bash

mypath=`cd $(dirname $0) && /bin/pwd`
cd $mypath || exit 1

path_sq_data=sonarqube/opt/sonarqube

for d in logs data extensions 
do
	p=$path_sq_data/$d
	echo "### $p" 1>&2
	if [[ ! -d $p ]]
	then
		(mkdir -p $p && chmod a+w $p) || exit 1
	fi
done

exec docker-compose up


