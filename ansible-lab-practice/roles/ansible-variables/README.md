# Ansible Variables Role

## Purpose
This role demonstrates how variables are used in Ansible
using multiple real-world methods.

---

## Variable Types Demonstrated

### 1. Variables inside playbook
- Strings
- Booleans
- Lists
- Dictionaries
- Nested structures

### 2. Variables from vars file
- Loaded using `vars_files`
- Stored inside role under `vars/main.yaml`

### 3. Runtime variables
- Passed using `-e` option
- Useful for versioning and environment-specific values

### 4. Registered variables
- Captures output of tasks
- Used for conditional logic and debugging

---

## How to run

```bash
ansible-playbook playbooks/ansible-variables-playbook.yaml \
-e "version=1.0.0 other_variable=from_runtime"
