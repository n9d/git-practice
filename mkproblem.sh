#!/bin/sh

rm -rf /src/practice/*

for script_file in /src/template/mkrepo*.sh ;do
    echo 練習問題作成スクリプト $script_file を実行中
    ${script_file} >/dev/null 2>&1
done

