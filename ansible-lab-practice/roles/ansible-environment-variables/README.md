# Ansible Environment Variables Role

## Purpose
This role is created to demonstrate how **environment variables**
are used in Ansible at different levels.

---

## What this role demonstrates
- Environment variables at playbook level
- Environment variables at task level
- Scope and visibility of environment variables

---

## Environment Variable Levels

### Playbook Level
Defined using `environment:` at the play level.

- Available to all tasks
- Commonly used for global configuration

Example:
```yaml
environment:
  EXAMPLE: "Foo bar"
