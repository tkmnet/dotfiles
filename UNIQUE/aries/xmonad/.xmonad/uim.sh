#!/bin/sh

case `uim-remote` in
	1)
		echo -n '<fc=#ffffff> E </fc>'
		;;
	2)
		echo -n '<fc=#ffffff,#ff0000> J </fc>'
		;;
	*)
		echo -n ' - '
esac
