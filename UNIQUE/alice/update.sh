#!/bin/sh

ln -sf $1/urxvt/.Xdefaults ~/

mkdir ~/.xmonad 2>/dev/null
ln -sf $2 $1/xmonad/.xmonad/autostart ~/.xmonad/
ln -sf $1/xmonad/.xmonad/xmonad.hs ~/.xmonad/
ln -sf $1/xmonad/.xmonad/xmobarrc ~/.xmonad/
ln -sf $1/xmonad/.xmonad/autostart.sh ~/.xmonad/
ln -sf $1/xmonad/.xmonad/fcitx.sh ~/.xmonad/
