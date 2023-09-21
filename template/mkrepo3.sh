#!/bin/bash
DIR=/src/practice/$(echo $0 | sed -e 's/^.*mk//' -e 's/.sh//' )
[ -d $DIR ] && rm -rf $DIR
CWD=$(pwd)
mkdir $DIR
cd $DIR
git init -q

touch foo.txt
git add foo.txt
git commit -a -m "initial commit"

echo -e "A\nB\nC\nD" > foo.txt
git commit -a -m "append ABCD"

git checkout -b branch1

sed -i s/A/1/ foo.txt
git commit -a -m "A->1"

sed -i s/B/2/ foo.txt
git commit -a -m "B->2"

git checkout master

sed -i s/D/4/ foo.txt
git commit -a -m "D->4"

git checkout branch1

sed -i s/1/10/ foo.txt
git commit -a -m "1->10"

cd $CWD
