#! /bin/sh

cd `dirname $0`

cp ~/.vimrc ./vim/
cp -r ~/.vim/ ./vim/ 2>/dev/null

cp ~/.login ./tcsh/
cp ~/.logout ./tcsh/
cp ~/.tcshrc ./tcsh/

git add -f *
git commit -am "Save"
git push
