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

mkdir -p ~/.config/openbox 2>/dev/null
ln -sf $1/lxde/openbox/lxde-rc.xml ~/.config/openbox/
mkdir -p ~/.config/autostart/resource 2>/dev/null
ln -sf $1/lxde/autostart/autostart-script.desktop ~/.config/autostart/
ln -sf $1/lxde/autostart/resource/autostart.sh ~/.config/autostart/resource/
ln -sf $2 $1/lxde/autostart/resource/autostart ~/.config/autostart/resource/
