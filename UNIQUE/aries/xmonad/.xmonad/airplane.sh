#!/bin/sh

if [ -f '/tmp/next_wlan_wwan_flag' ] ; then
	if [ `cat /tmp/next_wlan_wwan_flag` == 1 ] ; then
		echo -n "[Airplane Mode]"
	else
		echo -n
	fi
fi
