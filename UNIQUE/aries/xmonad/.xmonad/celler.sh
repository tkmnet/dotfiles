#!/bin/sh

if [ `ip addr | grep ppp0: | wc -l` == 0 ] ; then
	if [ -f '/tmp/next_wlan_wwan_flag' ] ; then
		if [ `cat /tmp/next_wlan_wwan_flag` == 0 ] ; then
			echo -n "Celler[Calling...]"
		fi
	fi
	echo
else
	echo -n "Celler[ON]"
fi
