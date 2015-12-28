#!/bin/sh

IP=`ip addr show dev wlp3s0 | awk 'match($0,/[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*/){print substr($0,RSTART,RLENGTH)}'`

if [ $IP != '' ]; then
	echo "|${IP}"
fi
