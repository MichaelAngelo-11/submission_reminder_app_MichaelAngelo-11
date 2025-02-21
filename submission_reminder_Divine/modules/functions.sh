#!/bin/bash
function check_submissions {
    local file=$1
    echo "Checking submissions in $file"
    while IFS=, read -r student assignment status; do
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "$student has not submitted $ASSIGNMENT!"
        fi
    done < <(tail -n +2 "$file")
}
