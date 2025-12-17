#!/bin/bash

echo "Employees:"
getent group employees | cut -d: -f4 | tr ',' '\n'
 
