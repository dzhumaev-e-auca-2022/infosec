#!/bin/bash

USERNAME=$1

if [ -z "$USERNAME" ]; then
  echo "Usage: ./manage_permissions.sh <username>"
  exit 1
fi

chmod 700 /home/$USERNAME

setfacl -m u:$USERNAME:rwx /home/$USERNAME
setfacl -m o::--- /home/$USERNAME

echo "$(date): Permissions restricted for $USERNAME" >> ../logs/user_mgmt.log

