#!/bin/sh

if test `ps aux | grep uim-xim | wc -l` -lt 2; then
	echo -n ' - '
	exit 0
fi

case "`/usr/local/bin/uim-remote`" in
	"1")
		echo -n '<fc=#ffffff> E </fc>' ;;
	"2")
		echo -n '<fc=#ffffff,#ff0000> J </fc>' ;;
	*)
		echo -n ' - ' ;;
esac

exit 0
