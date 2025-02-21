#!/bin/bash

# Ask for the user's name
echo "Enter your name:"
read user_name

# Create main directory
APP_DIR="submission_reminder_${user_name}"

# Create main directories for app structure
mkdir -p "$APP_DIR/app" "$APP_DIR/modules" "$APP_DIR/assets" "$APP_DIR/config"

echo "Setting up environment…"

# Create config.env
cat > "$APP_DIR/config/config.env" <<EOL
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOL
echo "config.env created."

# Create reminder.sh
cat > "$APP_DIR/app/reminder.sh" <<EOL
#!/bin/bash

# Get the absolute base directory of the script
BASE_DIR="\$(cd "\$(dirname "\$0")/.."; pwd)"

# Print debug information
echo "Base Directory: \$BASE_DIR"

# Check if the config file exists
if [[ ! -f "\$BASE_DIR/config/config.env" ]]; then
    echo "Error: config.env not found!"
    exit 1
fi

# Source environment variables and functions
source "\$BASE_DIR/config/config.env"
source "\$BASE_DIR/modules/functions.sh"

# Check if the submissions file exists
submissions_file="\$BASE_DIR/assets/submissions.txt"
if [[ ! -f "\$submissions_file" ]]; then
    echo "Error: Submissions file not found!"
    exit 1
fi

# Print assignment details
echo "Assignment: \$ASSIGNMENT"
echo "Days remaining: \$DAYS_REMAINING"
echo "--------------------------------------------"

# Run submission check
check_submissions "\$submissions_file"
EOL
chmod +x "$APP_DIR/app/reminder.sh"
echo "reminder.sh created."

# Create functions.sh
cat > "$APP_DIR/modules/functions.sh" <<EOL
#!/bin/bash

function check_submissions {
    local file=\$1
    echo "Checking submissions in \$file"
    while IFS=',' read -r student assignment status; do
        # Remove leading and trailing spaces
        student=\$(echo \$student | xargs)
        assignment=\$(echo \$assignment | xargs)
        status=\$(echo \$status | xargs)

        if [[ "\$assignment" == "\$ASSIGNMENT" && "\$status" == "not submitted" ]]; then
            echo "\$student has not submitted \$ASSIGNMENT!"
        fi
    done < <(tail -n +2 "\$file")
}
EOL
chmod +x "$APP_DIR/modules/functions.sh"
echo "functions.sh created."

# Create startup.sh
cat > "$APP_DIR/startup.sh" <<EOL
#!/bin/bash

# Get the base directory
BASE_DIR="\$(dirname "\$0")"

# Run the reminder script
bash "\$BASE_DIR/app/reminder.sh"
EOL
chmod +x "$APP_DIR/startup.sh"
echo "startup.sh created."

# Create submissions.txt
cat > "$APP_DIR/assets/submissions.txt" <<EOL
student,assignment,submission_status
Chinemerem,Shell Navigation,not submitted
Chiagoziem,Git,submitted
Divine,Shell Navigation,not submitted
Anissa,Shell Basics,submitted
Michael, Shell Navigation, not submitted
Chris, Git, submitted
Kevin, Shell Navigation, not submitted
Caroline, Shell Basics, submitted
EOL

echo "Setup complete!"
