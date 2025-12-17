#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

USERNAME=$1
ROLE=$2

if [ -z "$USERNAME" ] || [ -z "$ROLE" ]; then
  echo "Usage: ./create_user.sh <username> <role>"
  exit 1
fi

source ../config/roles.conf

if [ "$ROLE" == "EMPLOYEE" ]; then
  groupadd -f $EMPLOYEE_GROUP

  useradd -m -s /bin/bash -g $EMPLOYEE_GROUP $USERNAME

  chmod $EMPLOYEE_HOME_PERMS /home/$USERNAME

  passwd -d $USERNAME

  echo "$(date): Created employee user $USERNAME" >> ../logs/user_mgmt.log
else
  echo "Unknown role"
  exit 1
fi

