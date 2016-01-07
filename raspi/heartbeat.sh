#!/bin/sh

sudo chmod 777 /sys/class/leds/led0/trigger
sudo echo heartbeat > /sys/class/leds/led0/trigger
