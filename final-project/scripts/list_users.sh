#!/bin/bash

print_group_users() {
  GROUP_NAME=$1
  GROUP_GID=$(getent group "$GROUP_NAME" | cut -d: -f3)

  if [ -z "$GROUP_GID" ]; then
    return
  fi

  awk -F: -v gid="$GROUP_GID" '$4 == gid { print $1 }' /etc/passwd
}

echo "Admins:"
print_group_users admins

echo
echo "Employees:"
print_group_users employees

echo
echo "Interns:"
print_group_users interns
 
