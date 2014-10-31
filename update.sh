#! /bin/sh

cd `dirname $0`

if [ ! -e ./.superflag ]; then
	git reset --hard > /dev/null
fi

git pull > /dev/null
git submodule update --init > /dev/null

DFDIR=`pwd`

mkdir /tmp/test_takamin_dotfile 2> /dev/null
LN_DIR_FLAG=`ln -sdf /tmp/test_takamin_dotfile /tmp/test_takamin_dotfile_ln  2> /dev/null&& echo -n "-d" || echo -n ""`
rm -rf /tmp/test_takamin_dotfile
rm -rf /tmp/test_takamin_dotfile_ln


ln -sf $DFDIR/vim/.vimrc ~/.vimrc
mkdir ~/.vim 2>/dev/null
mkdir ~/.vim_temp 2>/dev/null
ln -sf $DFDIR/vim/.vimrc ~/
ln -sf $LN_DIR_FLAG $DFDIR/vim/.vim/userautoload ~/.vim/
ln -sf $LN_DIR_FLAG $DFDIR/vim/.vim/colors ~/.vim/
ln -sf $LN_DIR_FLAG $DFDIR/vim/.vim/snippets ~/.vim/
mkdir ~/.vim/bundle 2>/dev/null
ln -sf $LN_DIR_FLAG $DFDIR/vim/.vim/bundle/neobundle.vim ~/.vim/bundle/

ln -sf $DFDIR/tcsh/.tcshrc ~/
ln -sf $DFDIR/tcsh/.login ~/
ln -sf $DFDIR/tcsh/.logout ~/


if [ -e ./.superflag ]; then
	git add ./
	git commit -am "Save" >/dev/null
	git push 2> /dev/null
fi


vim -s vim/install.vim
