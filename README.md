
# 🛠️ Ansible Practice & Mini Projects

This repository contains my **complete Ansible learning journey**, covering **core concepts, hands-on labs, role-based implementations, and a real-world mini project**, backed by **Terraform-provisioned Azure infrastructure**.

The purpose of this repository is to demonstrate **practical DevOps automation skills** using Ansible, following **industry best practices** such as modular roles, idempotency, handlers, variables, and secure secret management.

---

## 📂 Repository Structure Overview

```text
ansible-practice-and-mini-projects/
├── terraform-ansible-azure-vm
├── ansible-nginx-website-deploy
└── ansible-lab-practice
```

Each directory represents a **specific phase of the Ansible learning workflow**, from infrastructure provisioning to real-world automation.

---

## 1️⃣ terraform-ansible-azure-vm

This directory contains **Terraform code to provision an Azure Virtual Machine**, which is used as the **target host** for all Ansible practice and mini projects.

### 🔹 Purpose

* Provision Azure VM using Infrastructure as Code
* Create a consistent and reproducible Ansible host machine
* Serve as the target node for:

  * `ansible-lab-practice`
  * `ansible-nginx-website-deploy`

### 🔹 Key Components

* Azure Resource Group
* Virtual Network & NSG
* Linux Virtual Machine
* Outputs for public IP access

This setup ensures **clean separation of concerns** between infrastructure provisioning (Terraform) and configuration management (Ansible).

---

## 2️⃣ ansible-nginx-website-deploy (Mini Project)

This is a **real-world Ansible mini project** that demonstrates **automated deployment of a static website using NGINX**.

### 🔹 Highlights

* Role-based Ansible architecture
* Automated NGINX installation and configuration
* Website source pulled from a public GitHub repository
* Idempotent deployment workflow
* Handlers used to reload NGINX on changes
* Cloud-agnostic design (tested on Azure VM)

### 🔹 Key Learnings

* Writing production-style Ansible roles
* Using handlers for service lifecycle management
* Git-driven application deployment
* Clean separation of tasks, variables, and handlers

This project is **portfolio-ready** and suitable for **interview discussions**.

---

## 3️⃣ ansible-lab-practice (Core Learning Directory)

This is the **core directory of the repository**, containing **hands-on practice for most important Ansible concepts**, implemented through **dedicated playbooks and roles**.

### 🔹 Covered Topics & Playbooks

```text
playbooks/
├── ansible-conditionals-playbook.yaml
├── ansible-environment-variables-playbook.yaml
├── ansible-error-handling-playbook.yaml
├── ansible-handlers-playbook.yaml
├── ansible-jinja2-templates-playbook.yaml
├── ansible-variables-playbook.yaml
├── ansible-vault-demo-playbook.yaml
├── first-demo-role-playbook.yaml
└── roles-and-tasks-playbook.yaml
```

Each playbook focuses on a **specific Ansible concept**, making the repository easy to understand and revise.

---

### 🔹 Role-Based Learning

Each topic is implemented as a **dedicated Ansible role**, and **every role contains its own README.md** explaining:

* What the role does
* Why the concept is important
* How it is implemented
* Real-world use cases

Some key roles include:

* Ansible Variables
* Conditionals
* Handlers
* Error Handling
* Jinja2 Templates
* Environment Variables
* Ansible Vault
* Webserver Role
* Demo Application Role

---

### 🔹 Additional Documentation

* `docs/Active-Passive-deloyment-with-Ansible.md`
  → Conceptual explanation of **Active–Passive deployment strategy**, documented for future real-world implementation.

* Vault implementation using:

  ```text
  group_vars/all/vault.yml
  ```

  to demonstrate **secure secret management**.

---

## ⚙️ Tools & Technologies Used

* **Ansible** – Configuration management & automation
* **Terraform** – Infrastructure provisioning
* **NGINX** – Web server automation
* **Azure VM** – Target infrastructure
* **Linux (Ubuntu)** – Operating system
* **Git & GitHub** – Version control

---

## 🎯 Who This Repository Is For

* DevOps beginners learning Ansible
* Intermediate engineers revising core concepts
* Interview preparation for Ansible & DevOps roles
* Anyone looking for **real, hands-on Ansible examples**

---

## 🧠 Key DevOps Concepts Demonstrated

* Infrastructure as Code (IaC)
* Role-based Ansible architecture
* Idempotent automation
* Secure secret management using Ansible Vault
* Git-driven configuration management
* Modular, reusable, and scalable playbooks
* Production-style DevOps workflows

---

## 🏁 Final Note

This repository represents my **end-to-end Ansible learning journey**, starting from **basic concepts** to a **real-world automation mini project**, backed by **Terraform-provisioned infrastructure**.

The content is designed for **learning, demonstration, and interview preparation**, and can be easily extended into **CI/CD pipelines or enterprise-grade automation**.

---

