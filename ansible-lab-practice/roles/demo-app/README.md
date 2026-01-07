
---

# Ansible Vault – Secure Secrets Management (Demo)

## 📌 Overview

This demonstration explains how to use **Ansible Vault** to securely manage sensitive data such as passwords, tokens, and credentials in Ansible playbooks and roles.

The demo covers:

* Encrypting sensitive variables
* Using Vault variables inside roles and templates
* Correct inventory & `group_vars` structure
* Common pitfalls and best practices

---

## 🧱 Project Structure

```text
ansible-lab-practice/
├── ansible.cfg
├── inventory/
│   ├── azure/
│   │   └── hosts
│   └── group_vars/
│       └── all/
│           └── vault.yml        # encrypted secrets
├── playbooks/
│   └── ansible-vault-demo-playbook.yaml
├── roles/
│   └── demo-app/
│       ├── tasks/
│       │   └── main.yaml
│       └── templates/
│           └── config.j2
├── vault-password.txt          # local use only (gitignored)
└── README.md
```

---

## 🔐 What Is Ansible Vault?

Ansible Vault is used to **encrypt sensitive data** such as:

* Database credentials
* API tokens
* Cloud secrets
* Passwords

Vault ensures secrets are:

* Not stored in plain text
* Safe to keep inside version control (encrypted)

---

## 🔑 Vault Variables File

📄 **inventory/group_vars/all/vault.yml** (Encrypted)

```yaml
db_username: admin
db_password: StrongPassword@123
api_token: abc123xyz
```

> This file is created and edited using:

```bash
ansible-vault create inventory/group_vars/all/vault.yml
ansible-vault edit inventory/group_vars/all/vault.yml
```

---

## ▶️ Playbook

📄 **playbooks/ansible-vault-demo-playbook.yaml**

```yaml
- name: Ansible Vault Demo
  hosts: azure_vm
  become: true

  roles:
    - demo-app
```

---

## 📦 Role Tasks

📄 **roles/demo-app/tasks/main.yaml**

```yaml
- name: Show database username
  debug:
    msg: "DB User is {{ db_username }}"

- name: Create application config file
  template:
    src: config.j2
    dest: /tmp/app-config.conf
```

---

## 📄 Template Using Vault Variables

📄 **roles/demo-app/templates/config.j2**

```jinja
DB_USERNAME={{ db_username }}
DB_PASSWORD={{ db_password }}
API_TOKEN={{ api_token }}
```

This file is rendered on the target host using encrypted values.

---

## 🚀 How to Run the Demo (IMPORTANT)

### ✅ Correct Way (Inventory as Directory)

```bash
ansible-playbook \
-i inventory \
playbooks/ansible-vault-demo-playbook.yaml \
--vault-password-file vault-password.txt
```

### OR (Prompt for password)

```bash
ansible-playbook \
-i inventory \
playbooks/ansible-vault-demo-playbook.yaml \
--ask-vault-pass
```

---

## 🔍 Verify Output on Target Host

```bash
cat /tmp/app-config.conf
```

Expected output:

```text
DB_USERNAME=admin
DB_PASSWORD=********
API_TOKEN=********
```

---

## ⚠️ Common Pitfall (Very Important)

### ❌ Wrong

```bash
ansible-playbook -i inventory/azure/hosts playbook.yml
```

This causes Vault variables to be **undefined** because:

* `group_vars` are loaded **relative to inventory root**
* Inventory root must be a **directory**, not a single file

### ✅ Correct

```bash
-i inventory
```

---

## 🧠 Key Learnings

* Vault variables are loaded **during inventory parsing**
* `group_vars` must exist **inside inventory hierarchy**
* Inventory **directory vs file** matters
* Vault password alone is not enough — inventory context is required

---

## 🧪 Useful Vault Commands

```bash
ansible-vault view inventory/group_vars/all/vault.yml
ansible-vault edit inventory/group_vars/all/vault.yml
ansible-vault rekey inventory/group_vars/all/vault.yml
ansible-vault encrypt secrets.yml
ansible-vault decrypt secrets.yml
```

---

## 🔐 Security Best Practices

* Never commit `vault-password.txt`
* Always `.gitignore` vault password files
* Separate secrets from logic
* Use Vault for local/demo setups
* Use external secret managers in production CI/CD

---

## 🎯 Interview Notes

* Vault encrypts files, variables, and strings
* Vault variables load during inventory parsing
* Inventory structure directly affects Vault behavior
* `group_vars` placement is critical

---

## ✅ Conclusion

This demonstration provides a **production-grade understanding** of Ansible Vault, including:

* Correct directory layout
* Secure secret handling
* Real-world debugging scenarios

Mastering this setup ensures your Ansible automation is **secure, maintainable, and interview-ready**.

---

