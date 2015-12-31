#!/bin/sh

mkdir ~/.xmonad 2>/dev/null
ln -sf $1/xmonad/.xmonad/xmonad.hs ~/.xmonad/
ln -sf $1/xmonad/.xmonad/xmobarrc ~/.xmonad/
ln -sf $1/xmonad/.xmonad/fcitx.sh ~/.xmonad/
