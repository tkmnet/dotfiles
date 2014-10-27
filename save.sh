#! /bin/sh

cd `dirname $0`

git add ./
git commit -am "Save"
git push
