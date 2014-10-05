#! /bin/bash

cp ~/.vimrc ./vim/
cp -r ~/.vim/ ./vim/

cp ~/.tcshrc ./tcsh/

git add -f *
git commit -am "Save"
git push
