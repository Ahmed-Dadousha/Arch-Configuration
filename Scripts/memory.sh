#!/bin/bash

# Get the current used memory in MB
memory=$(free -m |awk 'NR==2{print $3}')
TotMemory=$(free -h |awk 'NR==2{print $2}' |sed s/i//g)

# Subtract 220 from the used memory
memory=$((memory - 220))

# Check if the result is greater than 1024 (1GB)
if [ $memory -gt 1024 ]; then
    # If greater than 1GB, convert to GB
    memory=$(echo "scale=2; $memory / 1024" | bc)
    echo "${memory}G/${TotMemory}"
else
    # If less than or equal to 1GB, keep it in MB
    echo "${memory}M/${TotMemory}"
fi
