#!/bin/bash

USERNAME=$1
ROLE=$2

if [ -z "$USERNAME" ] || [ -z "$ROLE" ]; then
  echo "Usage: ./manage_permissions.sh <username> <role>"
  exit 1
fi

case $ROLE in
  EMPLOYEE|ADMIN)
    chmod 700 /home/$USERNAME
    ;;
  INTERN)
    chmod 600 /home/$USERNAME
    ;;
  *)
    echo "Invalid role"
    exit 1
    ;;
esac

echo "$(date): Applied $ROLE permissions to $USERNAME" >> $BASE_DIR/logs/user_mgmt.log

