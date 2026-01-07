
# Ansible Mini Project – Automated NGINX Website Deployment

## 📌 Overview

This mini project demonstrates the **automated deployment of a static website on an NGINX web server using Ansible**.
The website source code is fetched from a **public GitHub repository**, and the entire automation is implemented using a **role-based Ansible structure**.

The purpose of this project is to reflect **real-world DevOps automation practices**, emphasizing idempotency, modular design, reusability, and infrastructure-as-code principles.

---

## 🎯 Objectives

* Automate the installation and configuration of NGINX
* Pull static website content from a public GitHub repository
* Deploy website files to the NGINX web root (`/var/www/html`)
* Automatically reload NGINX when content changes
* Follow Ansible best practices using roles, handlers, and variables

---

## 🧱 Project Structure

```text
ansible-nginx-website-deploy/
├── ansible.cfg
├── inventory/
│   └── azure/
│       └── hosts
├── playbooks/
│   └── deploy-website.yml
├── roles/
│   └── nginx-web/
│       ├── handlers/
│       │   └── main.yml
│       ├── tasks/
│       │   ├── install.yml
│       │   ├── configure.yml
│       │   ├── deploy.yml
│       │   └── main.yml
│       └── vars/
│           └── main.yml
└── README.md
```

---

## ⚙️ Technology Stack

* **Ansible** – Configuration management and automation
* **NGINX** – Web server
* **GitHub** – Source code repository
* **Linux (Ubuntu)** – Target operating system
* **Azure VM** – Compute infrastructure (cloud-agnostic design)

---

## 🔧 Configuration

### Inventory

Target hosts are defined in:

```bash
inventory/azure/hosts
```

Example:

```ini
[azure_vm]
<VM_PUBLIC_IP> ansible_user=azureuser ansible_ssh_private_key_file=~/.ssh/id_rsa
```

### Variables

All configurable parameters are centralized in:

```bash
roles/nginx-web/vars/main.yml
```

This includes:

* NGINX package and service names
* Web root directory
* GitHub repository URL
* Branch to deploy

Centralizing variables improves maintainability, scalability, and reuse across environments.

---

## 🚀 Deployment Workflow

1. Ansible establishes SSH connectivity with the target VM
2. NGINX is installed using the system package manager
3. The NGINX service is enabled and started
4. Existing content in the web root is removed
5. Static website code is cloned from GitHub
6. NGINX is reloaded via handlers when changes are detected

---

## ▶️ Execution

Run the playbook from the project root directory:

```bash
ansible-playbook playbooks/deploy-website.yml
```

Inventory paths and role configurations are managed through `ansible.cfg`.

---

## ✅ Validation

After successful execution, verify the deployment by accessing:

```text
http://<VM_PUBLIC_IP>
```

The static website should be served through NGINX.

---

## 🧠 Key Learnings

* Role-based Ansible architecture
* Idempotent infrastructure automation
* Git-driven application deployment
* Service lifecycle management using handlers
* Separation of configuration and execution logic
* Production-style automation workflows

---


## 🏁 Summary

This project serves as a hands-on demonstration of **Ansible-based web server automation**.
It is suitable for learning, portfolio showcasing, and interview preparation, and can be easily extended into enterprise-grade CI/CD or GitOps pipelines.

---

## 🔥 Future Enhancements

* Secure sensitive data using **Ansible Vault**
* Integrate **Jenkins** for CI/CD automation
* Deploy applications on **AKS** with Ingress and TLS
* Implement **rolling**, **blue-green**, or **canary deployment** strategies

---


