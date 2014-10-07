#! /bin/sh

cd `dirname $0`

git pull

cp ./vim/.vimrc ~/
cp -r ./vim/.vim/ ~/
mkdir ~/.vim_temp

cp ./tcsh/.* ~/
