#!/bin/sh

UIM=`/usr/local/bin/uim-remote`
UIMSTAT=$?

if test $UIMSTAT -ne 0; then
	echo -n ' - '
	exit 0
fi

case "$UIM" in
	"1")
		echo -n '<fc=#ffffff> E </fc>' ;;
	"2")
		echo -n '<fc=#ffffff,#ff0000> J </fc>' ;;
	*)
		echo -n ' - ' ;;
esac

exit 0
