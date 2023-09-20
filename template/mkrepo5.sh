#!/bin/bash
DIR=/src/practice/$(echo $0 | sed -e 's/^.*mk//' -e 's/.sh//' )
[ -d $DIR ] && rm -rf $DIR
CWD=$(pwd)
mkdir $DIR
cd $DIR
git init -q

touch foo.txt
touch bar.txt
touch buzz.txt
git add foo.txt bar.txt buzz.txt
git commit -a -m "initial commit"

git checkout -b branch1

echo -e "A" > foo.txt
git commit -a -m "append A"

echo -e "B" > bar.txt
git commit -a -m "append B"

echo -e "C" > buzz.txt
git commit -a -m "append C"

sed -i s/A/1/ foo.txt
git commit -a -m "A->1"

sed -i s/B/2/ bar.txt
git commit -a -m "B->2"

git checkout -b branch2
git checkout -b branch3

sed -i s/C/3/ buzz.txt
git commit -a -m "C->3"

git checkout branch2

sed -i s/1/X/ foo.txt
git commit -a -m "1->X"

sed -i s/2/Y/ bar.txt
git commit -a -m "2->Y"

sed -i s/C/Z/ buzz.txt
git commit -a -m "C->Z"


sleep 1

git checkout master
git merge branch2 --no-ff -m "merge branch2"

git checkout branch3

cd $CWD
