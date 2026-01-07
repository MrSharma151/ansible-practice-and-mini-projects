
# Ansible Error Handling Role

## Overview

This role showcases various **Ansible error-handling mechanisms** that help manage task failures gracefully and ensure playbook execution remains controlled and predictable during automation.

---

## Error Handling Techniques Explained

### 1. `ignore_errors`

Allows a playbook to continue executing even if a task fails.

```yaml
ignore_errors: yes
```

**Use case:**
Helpful when a task failure is non-critical and should not stop the entire automation workflow.

---

### 2. `failed_when`

Provides manual control over when a task should be considered failed.

```yaml
failed_when: <condition>
```

**Use case:**
Useful when command exit codes are unreliable or when failure conditions need to be explicitly defined.

---

### 3. `changed_when`

Controls whether a task reports a **changed** status.

```yaml
changed_when: false
```

**Use case:**
Prevents false-positive changes when a task executes successfully but does not actually modify the system.

---

### 4. `block`, `rescue`, and `always`

Enables structured error handling similar to `try / catch / finally` in programming languages.

```yaml
block:
  # main execution logic

rescue:
  # recovery or fallback actions

always:
  # cleanup tasks
```

**Behavior:**

* **block** → Primary task execution
* **rescue** → Executes when a task in `block` fails
* **always** → Runs regardless of success or failure

---

## How to Run the Playbook

```bash
ansible-playbook playbooks/ansible-error-handling-playbook.yaml
```


