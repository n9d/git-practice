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

sed -i s/A/1/ foo.txt
git commit -a -m "A->1"

sed -i s/B/2/ foo.txt
git add foo.txt

sed -i s/C/3/ foo.txt


cd $CWD
