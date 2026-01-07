# Handlers Demo Role

## Purpose
This role is created to practice and understand **Ansible handlers**
using a real and practical example.

The role demonstrates how handlers are triggered using `notify`
and executed only when a task reports a change.

---

## What this role does
- Installs Nginx on the target server
- Deploys a custom `index.html` file
- Restarts Nginx **only when the website content changes**

This ensures idempotent and production-safe automation.

---

## How to run this role

Execute the dedicated playbook:

```bash
ansible-playbook playbooks/first-demo-playbook.yaml


handlers-demo/
├── README.md
├── tasks/
│   └── main.yaml
├── notify-handler/
│   └── main.yaml
└── templates/
    ├── index.html
    └── updated-index.html

