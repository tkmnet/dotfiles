#!/bin/sh

mkdir ~/.xmonad 2>/dev/null
ln -sf $2 $1/xmonad/.xmonad/autostart ~/.xmonad/
ln -sf $1/xmonad/.xmonad/xmonad.hs ~/.xmonad/
ln -sf $1/xmonad/.xmonad/xmobarrc ~/.xmonad/
ln -sf $1/xmonad/.xmonad/autostart.sh ~/.xmonad/
ln -sf $1/xmonad/.xmonad/uim.sh ~/.xmonad/
ln -sf $1/xmonad/.xmonad/airplane.sh ~/.xmonad/
ln -sf $1/xmonad/.xmonad/celler.sh ~/.xmonad/
ln -sf $1/xmonad/.xmonad/wlipaddr.sh ~/.xmonad/
ln -sf $1/xmonad/.xmonad/battery.sh ~/.xmonad/
