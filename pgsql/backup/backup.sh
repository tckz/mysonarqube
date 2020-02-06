#!/bin/bash

mypath=`cd $(dirname $0) && /bin/pwd`

now=`date +%Y%m%d_%H%M%S`
out=$mypath/pg_dump.sonar.$now

echo "### $out" 1>&2
pg_dump -d sonar -U sonar -f $out && gzip $out

