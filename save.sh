#! /bin/bash

cp ~/.vimrc ./vim/
cp -r ~/.vim/ ./vim/

git add -f *
git commit -am "Save"
git push
