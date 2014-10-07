#! /bin/sh

cd `dirname $0`

git pull

cp ./vim/.vimrc ~/
cp -r ./vim/.vim/ ~/ 2>/dev/null
mkdir ~/.vim_temp 2>/dev/null

cp ./tcsh/.tcshrc ~/
cp ./tcsh/.login ~/
cp ./tcsh/.logout ~/
