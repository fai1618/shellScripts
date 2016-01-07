#!/bin/sh

vcgencmd measure_temp
vcgencmd measure_volts
vcgencmd measure_clock arm
exit 0
