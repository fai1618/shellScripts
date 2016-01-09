#!/bin/sh
# vim: set fileencoding=utf-8 :
#
# Author:   yamada kouhei
# Created:  2015-11-21
#
for i in {255..0} ; do
    printf "\x1b[38;5;${i}mcolour⬛︎⬛︎ ${i} \n"
done
printf "\n"
