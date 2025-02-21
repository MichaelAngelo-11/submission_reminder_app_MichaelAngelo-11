#!/bin/bash

# Get the base directory
BASE_DIR="$(dirname "$(dirname "$0")")"

# Source environment variables and functions
source "$BASE_DIR/config/config.env"
source "$BASE_DIR/modules/functions.sh"

# Path to the submissions file
submissions_file="$BASE_DIR/assets/submissions.txt"

# Print assignment details
echo "Assignment: $ASSIGNMENT"
echo "Days remaining: $DAYS_REMAINING"
echo "--------------------------------------------"

# Run submission check
check_submissions "$submissions_file"
