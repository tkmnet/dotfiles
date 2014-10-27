#! /bin/sh

cd `dirname $0`

git pull

mkdir ~/.vim_temp 2>/dev/null
ln -sf ./vim/.vimrc ~/
mkdir ~/.vim 2>/dev/null
ln -sf ./vim/.vim/userautoload ~/.vim/
ln -sf ./vim/.vim/colors ~/.vim/
ln -sf ./vim/.vim/snippets ~/.vim/
ln -sf ./vim/.vimrc ~/
mkdir ~/.vim/bundle 2>/dev/null
ln -sf ./vim/.vim/bundle/neobundle.vim ~/.vim/bundle/

ln -se ./tcsh/.tcshrc ~/
ln -se ./tcsh/.login ~/
ln -se ./tcsh/.logout ~/
