#!/usr/bin/bash

PREV=$(xbacklight -get)
for i in {1..2}
do
    xbacklight -set 100
    sleep 0.001
    xbacklight -set 0
    sleep 0.001
done
xbacklight -set $PREV
