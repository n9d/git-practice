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

git checkout -b branch1

echo -e "A\nB\nC" > foo.txt
git commit -a -m "append ABC"

echo -e "D\nE\nF" >> foo.txt
git commit -a -m "append DEF"

echo -e "G\nH\nI" >> foo.txt
git commit -a -m "append GHI"

sed -i s/E/J/ foo.txt
git commit -a -m "E->J"

sed -i s/C/K/ foo.txt
git commit -a -m "C->K"

sed -i s/H/L/ foo.txt
git add foo.txt

sed -i s/L/M/ foo.txt


cd $CWD
