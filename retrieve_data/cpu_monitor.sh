#!/bin/bash

##############
# Author: Mithun Gowda
# Date: 05-03-2024
# 
#
# This script monitors the CPU usage and logs the information to a file
# check logged details : cat /var/log/cpu_monitor.log
##############

set -x
set -o

# Log file path
LOG_FILE="/var/log/cpu_monitor.log"

# Function to get current CPU usage
get_cpu_usage() {
    # Using 'top' command to get CPU usage
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')
    echo "$CPU_USAGE"
}

# Main function
main() {
    # Get current timestamp
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

    # Get CPU usage
    CPU_USAGE=$(get_cpu_usage)

    # Log CPU usage to file
    echo "$TIMESTAMP - CPU Usage: $CPU_USAGE%" >> "$LOG_FILE"
}

# Run main function
main

