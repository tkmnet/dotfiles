#! /bin/sh

git version 2> /dev/null > /dev/null || exit
vim --version 2> /dev/null > /dev/null || exit

cd `dirname $0`

if [ ! -e ./.superflag ]; then
	git reset --hard > /dev/null
fi

git pull > /dev/null

if [ $# -ne 0 ]; then
	GIT_VER=`git log -1 | head -1 | tr -d "\n"`
	LOCAL_VER=`cat ./.local-version 2> /dev/null | tr -d "\n"`
	if [ $1 = "-l" -a  "$GIT_VER" = "$LOCAL_VER" ]; then
		exit
	fi
fi

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
ln -sf $LN_DIR_FLAG $DFDIR/vim/.vim/vimrc.d ~/.vim/
ln -sf $LN_DIR_FLAG $DFDIR/vim/.vim/colors ~/.vim/
ln -sf $LN_DIR_FLAG $DFDIR/vim/.vim/snippets ~/.vim/
mkdir ~/.vim/bundle 2>/dev/null
ln -sf $LN_DIR_FLAG $DFDIR/vim/.vim/bundle/neobundle.vim ~/.vim/bundle/
mkdir ~/.vim/after 2>/dev/null
mkdir ~/.vim/after/syntax 2>/dev/null
ln -sf $LN_DIR_FLAG $DFDIR/vim/.vim/after/syntax/tex.vim ~/.vim/after/syntax/

ln -sf $DFDIR/bash/.bashrc ~/
ln -sf $DFDIR/zsh/.zshrc ~/

ln -sf $DFDIR/tcsh/.tcshrc ~/
ln -sf $DFDIR/tcsh/.login ~/
ln -sf $DFDIR/tcsh/.logout ~/

ln -sf $DFDIR/screen/.screenrc ~/
ln -sf $DFDIR/screen/.tmux.conf ~/

mkdir -p ~/.config 2>/dev/null
ln -sf $LN_DIR_FLAG $DFDIR/fcitx ~/.config/

#ln -sf $LN_DIR_FLAG $DFDIR/xmonad/.xmonad ~/


if [ -x ./UNIQUE/`hostname`/update.sh ]; then
	cd ./UNIQUE/`hostname`
	./update.sh "`pwd`"
fi
cd $DFDIR


if [ -e ./.superflag ]; then
	git add ./
	git commit -am "Save" >/dev/null
	git push 2> /dev/null
fi

GIT_VER=`git log -1 | head -1 | tr -d "\n"`
echo -n $GIT_VER > ./.local-version

vim -s vim/install.vim
