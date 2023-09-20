#!/bin/bash
if [ -f ~/git-completion.sh ]; then
    source ~/git-completion.sh
fi
if [ -f ~/git-prompt.sh ]; then
    source ~/git-prompt.sh
fi
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

PS1='[\[\033[32m\]\u@docker\[\033[00m\] \[\033[33m\]\w\[\033[1;36m\]$(__git_ps1 " (%s)")\[\033[00m\]]\n$ '
git config --global --add safe.directory /src

rm -rf /src/practice
mkdir /src/practice

for script_file in ./template/mkrepo*.sh ;do
    echo 練習問題作成スクリプト $script_file を実行中
    #${script_file} >/dev/null 2>&1
done

cd /src/practice

