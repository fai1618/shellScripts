#!/bin/sh
GPIO=22     #使用するGPIOポート
PUSHTIME=5  #シャットダウンを実行する秒数

echo  "\033[0;36m shutdown.sh is running\033[0;0m"

## 初期設定
echo "$GPIO" > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio$GPIO/direction
echo "low" > /sys/class/gpio/gpio$GPIO/direction

## ACT LEDの制御
set_led_mode () {
  echo $1 > /sys/class/leds/led0/trigger
}
set_led_value () {
  echo $1 > /sys/class/leds/led0/brightness
}

## 5秒間押されるまで待つ
cnt=0
while [ $cnt -lt $PUSHTIME ] ; do
  if [ `cat /sys/class/gpio/gpio$GPIO/value` -eq "1" ] ; then
    cnt=`expr $cnt + 1`
    [ $cnt -eq 1 ] && set_led_mode timer
  else
    [ $cnt -gt 0 ] && set_led_mode heartbeat
    cnt=0
  fi
  sleep 1
done

## シャットダウンの合図(LED)
#set_led_mode none
#set_led_value 1
#sleep 2
#set_led_value 1
set_led_mode mmc0

## シャットダウンの実行
sudo shutdown -h now
