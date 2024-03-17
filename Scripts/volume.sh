#!/bin/bash

arg=$1
[ $arg = "up"     ] && amixer sset Master 1%+
[ $arg = "down"   ] && amixer sset Master 1%-
[ $arg = "toggle" ] && amixer sset Master toggle

 pkill -RTMIN+10 dwmblocks
