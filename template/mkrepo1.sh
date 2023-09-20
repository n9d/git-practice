#!/bin/bash
DIR=practice/$(echo $0 | sed -e 's/^.*mk//' -e 's/.sh//' )
[ -d $DIR ] && rm -rf $DIR
CWD=$(pwd)
mkdir $DIR
cd $DIR
git init -q

touch foo.txt
git add foo.txt
git commit -a -m "initial commit"

git checkout -b branch1

echo -e "A\nB\nC" > foo.txt
git commit -a -m "append ABC"

echo -e "D\nE\nF" >> foo.txt
git commit -a -m "append DEF"

echo -e "G\nH\nI" >> foo.txt
git commit -a -m "append GHI"

git checkout -b branch2
git checkout branch2

sed -i s/E/J/ foo.txt
git commit -a -m "E->J"

sed -i s/C/K/ foo.txt
git commit -a -m "C->K"

sed -i s/H/L/ foo.txt
git commit -a -m "H->L"

sed -i s/L/M/ foo.txt
git commit -a -m "L->M"

git checkout -b branch3

sed -i s/E/N/ foo.txt
git commit -a -m "E->N"

sed -i s/B/O/ foo.txt
git commit -a -m "B->O"

sed -i s/H/P/ foo.txt
git commit -a -m "H->P"

sleep 1

git checkout master
git merge branch1 --no-ff -m "merge branch1"

git checkout branch3

cd $CWD
