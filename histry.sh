#!/bin/sh


history | awk '{print $2}' | sort | uniq -c | sort -nr
