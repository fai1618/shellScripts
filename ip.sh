#!/bin/sh
# /etc/cron.daily/current_ip

if [ "$(uname)" = "Darwin" ]; then
  IP_WEWN=`ifconfig en0 | sed -nEe 's/^[[:space:]]+inet[[:space:]]+([0-9.]+).*$/\1/p'`
  IP_ZEWN=`wget -q -O - ipcheck.ieserver.net | tail`
  echo $IP_WEWN and $IP_ZEWN #> $HOME/ip
elif [ "$(uname)" = "Linux" ]; then
  IP_WEWN=`/sbin/ifconfig wlan0 | /bin/grep "inet addr" | /usr/bin/cut -d ":" -f 2 | /usr/bin/cut -d " " -f 1`
  IP_ZEWN=`wget -q -O - ipcheck.ieserver.net | tail`
  echo $IP_WEWN and $IP_ZEWN #> $HOME/ip
fi