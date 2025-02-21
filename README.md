# Submission Reminder Script

This project is a simple Bash script that reminds students to submit their assignments. It reads a list of students and their submission status and prints out reminders for those who have not submitted their assignments.

## Prerequisites
- Ensure you have Bash installed on your system.
- Give executable permissions to the scripts:
  ```bash
  chmod +x startup.sh
  chmod +x create_environment.sh
  ```

## Directory Structure
```
submission_reminder_<username>/
├── app/
│   └── reminder.sh
├── modules/
│   └── functions.sh
├── assets/
│   └── submissions.txt
├── config/
│   └── config.env
├── startup.sh
```  

## Installation and Setup
1. Clone the repository or create the script manually.
2. Open a terminal and navigate to the project directory.
3. Run the setup script:
   ```bash
   bash create_environment.sh
   ```
4. This will create the necessary files and directories.

## Usage
1. Navigate to the project directory:
   ```bash
   cd submission_reminder_<username>
   ```
2. Run the reminder script:
   ```bash
   ./startup.sh
   ```
3. The script will check the `submissions.txt` file and display students who haven't submitted their assignments.

## Configuration
- The `config.env` file allows customization of the assignment name and the number of days remaining.
- You can update the assignment details by modifying `config/config.env`.

## Example Output
```
Assignment: Shell Navigation
Days remaining: 2
--------------------------------------------
Checking submissions in assets/submissions.txt
Reminder: Chinemerem has not submitted the Shell Navigation assignment!
Reminder: Divine has not submitted the Shell Navigation assignment!
```


