#!/bin/bash

# Get the absolute base directory of the script
BASE_DIR="$(cd "$(dirname "$0")/.."; pwd)"

# Print debug information
echo "Base Directory: $BASE_DIR"

# Check if the config file exists
if [[ ! -f "$BASE_DIR/config/config.env" ]]; then
    echo "Error: config.env not found!"
    exit 1
fi

# Source environment variables and functions
source "$BASE_DIR/config/config.env"
source "$BASE_DIR/modules/functions.sh"

# Check if the submissions file exists
submissions_file="$BASE_DIR/assets/submissions.txt"
if [[ ! -f "$submissions_file" ]]; then
    echo "Error: Submissions file not found!"
    exit 1
fi

# Print assignment details
echo "Assignment: $ASSIGNMENT"
echo "Days remaining: $DAYS_REMAINING"
echo "--------------------------------------------"

# Run submission check
check_submissions "$submissions_file"
