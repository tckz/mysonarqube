#!/bin/bash

mypath=`cd $(dirname $0) && /bin/pwd`
cd $mypath || exit 1

unset http_proxy
unset https_proxy

path_sq_data=sonarqube/opt/sonarqube

for d in logs data extensions pgsql/backup
do
	p=$path_sq_data/$d
	echo "### $p" 1>&2
	if [[ ! -d $p ]]
	then
		mkdir -p $p || exit 1
	fi
	chmod a+w $p || exit 1
done

exec docker compose up --pull always


