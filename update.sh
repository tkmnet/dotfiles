#! /bin/sh

cd `dirname $0`

git pull

DFDIR=`pwd`
echo $DFDIR/test

ln -sf $DFDIR/vim/.vimrc ~/.vimrc
mkdir ~/.vim_temp 2>/dev/null
ln -sf $DFDIR/vim/.vimrc ~/
mkdir ~/.vim/userautoload 2>/dev/null
ln -sf $DFDIR/vim/.vim/userautoload/* ~/.vim/
mkdir ~/.vim/colors 2>/dev/null
ln -sf $DFDIR/vim/.vim/colors/* ~/.vim/
mkdir ~/.vim/snippets 2>/dev/null
ln -sf $DFDIR/vim/.vim/snippets/* ~/.vim/
mkdir ~/.vim/bundle/neobundle.vim 2>/dev/null
ln -sf $DFDIR/vim/.vim/bundle/neobundle.vim/* ~/.vim/bundle/

ln -sf ./tcsh/.tcshrc ~/
ln -sf ./tcsh/.login ~/
ln -sf ./tcsh/.logout ~/


git add ./
git commit -am "Save"
git push
