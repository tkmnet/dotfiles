#! /bin/bash

cp ~/.vimrc ./vim/
cp -r ~/.vim/ ./vim/

cp ~/.login ./tcsh/
cp ~/.logout ./tcsh/
cp ~/.tcshrc ./tcsh/

git add -f *
git commit -am "Save"
git push
