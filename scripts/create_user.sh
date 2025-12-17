#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

USERNAME=$1
ROLE=$2

if [ -z "$USERNAME" ] || [ -z "$ROLE" ]; then
  echo "Usage: ./create_user.sh <username> <EMPLOYEE|ADMIN|INTERN>"
  exit 1
fi

source ../config/roles.conf

case $ROLE in
  EMPLOYEE)
    GROUP=$EMPLOYEE_GROUP
    PERMS=$EMPLOYEE_HOME_PERMS
    ;;
  ADMIN)
    GROUP=$ADMIN_GROUP
    PERMS=$ADMIN_HOME_PERMS
    ;;
  INTERN)
    GROUP=$INTERN_GROUP
    PERMS=$INTERN_HOME_PERMS
    ;;
  *)
    echo "Invalid role"
    exit 1
    ;;
esac

groupadd -f $GROUP
useradd -m -s /bin/bash -g $GROUP $USERNAME
chmod $PERMS /home/$USERNAME
passwd -d $USERNAME

echo "$(date): Created $ROLE user $USERNAME" >> ../logs/user_mgmt.log

