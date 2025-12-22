#!/bin/bash

USERNAME=$1

if [ -z "$USERNAME" ]; then
  echo "Usage: ./delete_user.sh <username>"
  exit 1
fi

userdel -r $USERNAME

echo "$(date): Deleted user $USERNAME" >> $BASE_DIR/logs/user_mgmt.log

