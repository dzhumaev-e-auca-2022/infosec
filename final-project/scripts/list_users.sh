#!/bin/bash

echo "Admins:"
getent group admins | cut -d: -f4 | tr ',' '\n'

echo
echo "Employees:"
getent group employees | cut -d: -f4 | tr ',' '\n'

echo
echo "Interns:"
getent group interns | cut -d: -f4 | tr ',' '\n'
 
