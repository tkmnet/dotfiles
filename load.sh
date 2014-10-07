#! /bin/sh

git pull

cp ./vim/.vimrc ~/
cp -r ./vim/.vim/ ~/
mkdir ~/.vim_temp

cp ./tcsh/.* ~/
