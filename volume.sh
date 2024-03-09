#!/bin/bash

arg=$1
[ $arg = "up" ] && amixer sset Master 5%+
[ $arg = "down" ] && amixer sset Master 5%-
[ $arg = "toggle" ] && amixer sset Master toggle
