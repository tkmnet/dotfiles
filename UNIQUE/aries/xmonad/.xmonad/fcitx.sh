#!/bin/sh

case `fcitx-remote` in
	1)
		echo -n 'EN'
		;;
	2)
		echo -n 'JP'
		;;
	*)
		echo -n '--'
esac
