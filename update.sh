#! /bin/sh

cd `dirname $0`

if [ -e ./.superflag ]; then
	git pull
	git submodule update
fi

DFDIR=`pwd`


ln -sf $DFDIR/vim/.vimrc ~/.vimrc
mkdir ~/.vim 2>/dev/null
mkdir ~/.vim_temp 2>/dev/null
ln -sf $DFDIR/vim/.vimrc ~/
ln -sdf $DFDIR/vim/.vim/userautoload ~/.vim/
ln -sdf $DFDIR/vim/.vim/colors ~/.vim/
ln -sdf $DFDIR/vim/.vim/snippets ~/.vim/
mkdir ~/.vim/bundle 2>/dev/null
ln -sdf $DFDIR/vim/.vim/bundle/neobundle.vim ~/.vim/bundle/

ln -sf $DFDIR/tcsh/.tcshrc ~/
ln -sf $DFDIR/tcsh/.login ~/
ln -sf $DFDIR/tcsh/.logout ~/


git add ./
git commit -am "Save" >/dev/null
git push


vi -s vim/install.vim
