# User Management Automation – Information Security Final Project

## Overview

This project implements a **secure, role-based user management automation system**
for Linux environments using **Bash scripting**.

The goal of the project is to demonstrate practical applications of
**Information Security principles** such as:
- Least privilege
- Role-based access control (RBAC)
- Auditing and accountability
- Secure system administration

The system automatically creates, manages, audits, and deletes users
with predefined security restrictions based on their assigned role.

---

## Environment

- OS: Ubuntu (WSL)
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
│   ├── delete_user.sh
│   ├── manage_permissions.sh
│   └── list_users.sh
├── logs/
│   └── user_mgmt.log
└── README.md

