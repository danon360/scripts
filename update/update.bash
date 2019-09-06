#!/bin/bash
OUTPUT=/home/x/Desktop/updates.log;
DATE=$(date +"%t%t%t%t%t%t%t%t%t-------- %A %d of %B , %Y --------%n");
#apt-get update;
echo "$DATE" >> $OUTPUT;
apt list --upgradable >> $OUTPUT;
#apt-get update -y;

