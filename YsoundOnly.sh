#!/bin/bash

# 実行時に指定された引数の数、つまり変数 $# の値が 1 でなければエラー終了。
if [ $# -ne 1 ]; then
    echo "指定された引数は$#個です。" 1>&1
      echo "実行するには1個の引数が必要です。" 1>&1
        exit 1
      fi
youtube-dl $1 -f bestaudio -o - | mplayer -
