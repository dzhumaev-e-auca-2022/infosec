# User Management Automation – Information Security Final Project

## Demo Video

📽️ **Demo Video:**  
https://github.com/user-attachments/assets/4b2eef38-b6e0-45bd-984a-52410235aa99

The video demonstrates:
- Creating users with different roles
- Enforcing permissions
- Auditing users
- Deleting users

- Viewing logs

---

## Overview

This project implements a **secure, role-based user management automation system**
for Linux using **Bash scripting**.

The goal is to demonstrate practical **Information Security concepts**, including:
- Least privilege
- Role-Based Access Control (RBAC)
- Secure system administration
- Auditing and accountability

The system automates user creation, permission management, auditing, and deletion
based on predefined roles.

---

## Environment

- Operating System: Ubuntu Linux (WSL)
- Shell: Bash
- Privileges: Root access required for user management
- Version Control: Git

---

## Project Structure

```text
final-project/
├── config/
│   └── roles.conf
├── scripts/
│   ├── create_user.sh
│   ├── manage_permissions.sh
│   ├── delete_user.sh
│   └── list_users.sh
├── logs/
│   └── user_mgmt.log
└── README.md
```
---

## Security Model

The project uses **Role-Based Access Control (RBAC)** to restrict user privileges
based on their assigned role.

### Defined Roles

| Role     | Access Model | Security Rationale |
|----------|-------------|--------------------|
| Admin    | Full access to own home directory | Allows administrative work without unnecessary system-wide privileges |
| Employee | Full access only to own home directory | Enforces least privilege and prevents lateral access |
| Intern   | Read/write access only, no execution | Reduces risk of unauthorized script execution |

Permissions are enforced at the filesystem level using Linux ownership and mode bits.

---

## Role Configuration

Role permissions are defined in `config/roles.conf`:
```
EMPLOYEE_HOME_PERMS=700
EMPLOYEE_GROUP=employees

ADMIN_HOME_PERMS=700
ADMIN_GROUP=admins

INTERN_HOME_PERMS=600
INTERN_GROUP=interns
```
Separating role configuration from executable scripts allows centralized policy
management, easier auditing, and safe extensibility.

---

## Scripts Description

### create_user.sh

Creates a new user based on a specified role.

Features:
- Role validation
- Role-based group assignment
- Restricted home directory permissions
- Centralized logging

Usage:
```text
sudo ./create_user.sh <username> <EMPLOYEE|ADMIN|INTERN>
```
---

### manage_permissions.sh

Applies or reapplies filesystem permissions based on user role.

Purpose:
- Enforces least privilege
- Disables execution for intern accounts

Usage:
```text
sudo ./manage_permissions.sh <username> <role>
```
---

### delete_user.sh

Securely deletes a user account.

Features:
- Removes the user and home directory
- Logs deletion for auditing

Usage:
```text
sudo ./delete_user.sh <username>
```
---

### list_users.sh

Lists users grouped by role.

Purpose:
- Auditing
- Role verification
- Administrative review

Usage:
```text
./list_users.sh
```
