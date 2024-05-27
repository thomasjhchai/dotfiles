#!/bin/bash

# Check if TLP is installed
if ! command -v tlp &> /dev/null
then
    echo "TLP is not installed. Please install TLP first."
    exit 1
fi

# Function to set the battery charge stop level
set_charge_level() {
    start_percentage=$1
    stop_percentage=$2

    # Check if the percentages are within the valid range (0-100)
    if ! [[ $start_percentage =~ ^[0-9]+$ && $start_percentage -ge 0 && $start_percentage -le 100 && \
            $stop_percentage =~ ^[0-9]+$ && $stop_percentage -ge 0 && $stop_percentage -le 100 ]]; then
        echo "Invalid percentages. Please provide numbers between 0 and 100."
        exit 1
    fi

    # Set the battery charge start and stop levels
    sudo tlp setcharge $start_percentage $stop_percentage
}

# Check if the argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <start_percentage> <stop_percentage>"
    exit 1
fi

if [ "$1" == "full" ]; then
    # Set battery charge to full
    sudo tlp fullcharge
else
    # Set battery charge to specific start and stop percentages
    set_charge_level $1 $2
fi
