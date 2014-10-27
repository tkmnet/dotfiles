#! /bin/sh

cd `dirname $0`

git pull

RL_TARGET_FILE=./
while [ "$RL_TARGET_FILE" != "" ]; do
cd `dirname $RL_TARGET_FILE`
RL_FILENAME=`basename $RL_TARGET_FILE`
RL_TARGET_FILE=`readlink $RL_FILENAME`
done
echo $RL_FILENAME
 
LOGDIR=`pwd -P`/$RL_FILENAME
echo $LOGDIR

ln -sf ./vim/.vimrc ~/.vimrc
mkdir ~/.vim_temp 2>/dev/null
ln -sf ./vim/.vimrc ~/
mkdir ~/.vim/userautoload 2>/dev/null
ln -sf ./vim/.vim/userautoload/* ~/.vim/
mkdir ~/.vim/colors 2>/dev/null
ln -sf ./vim/.vim/colors/* ~/.vim/
mkdir ~/.vim/snippets 2>/dev/null
ln -sf ./vim/.vim/snippets/* ~/.vim/
mkdir ~/.vim/bundle/neobundle.vim 2>/dev/null
ln -sf ./vim/.vim/bundle/neobundle.vim/* ~/.vim/bundle/

ln -sf ./tcsh/.tcshrc ~/
ln -sf ./tcsh/.login ~/
ln -sf ./tcsh/.logout ~/


git add ./
git commit -am "Save"
git push
