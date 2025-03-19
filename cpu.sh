#!/bin/sh


    # Read the first line of /proc/stat
    read cpu user nice system idle iowait irq softirq steal guest guest_nice < /proc/stat
    
    # Calculate total and idle CPU time
    total=$((user + nice + system + idle + iowait + irq + softirq + steal))
    
    # Calculate CPU usage percentage
    cpu_usage=$(( (100 * (total - idle)) / total ))
    
    # Print output
    echo "$cpu_usage%"
