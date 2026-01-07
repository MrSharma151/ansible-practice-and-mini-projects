# Common Role

## Purpose
The `first-demo` role is used to perform basic system-level tasks
that should be applied to every server.

This role acts as a foundation for all other roles.

---

## Tasks Covered (so far)
- Update apt package index

---

## Why this role exists
In real-world Ansible projects, a common role is used to:
- Prepare servers
- Apply baseline configuration
- Run shared tasks across all hosts

This keeps playbooks clean and avoids repetition.

---

## How this role is used

This role is executed from the main site playbook:

```bash
ansible-playbook playbooks/first-demo-playbook.yaml
