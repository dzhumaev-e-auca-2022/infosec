#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(dirname "$SCRIPT_DIR")"

USERNAME=$1

if [ -z "$USERNAME" ]; then
  echo "Usage: ./delete_user.sh <username>"
  exit 1
fi

# Delete user and home directory
userdel -r "$USERNAME" 2>/dev/null

# Log action
echo "$(date): Deleted user $USERNAME" >> "$BASE_DIR/logs/user_mgmt.log"

