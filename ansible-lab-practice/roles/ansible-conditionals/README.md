
# Ansible Conditionals Role

## Purpose
This role demonstrates how to use **Ansible conditionals**
using the `when` keyword in real-world scenarios.

---

## What this role covers
- Boolean-based conditionals
- Multiple conditions using lists
- Complex logical expressions
- Conditionals with registered variables
- Conditionals inside loops
- Conditionals using `ansible_facts`

---

## Condition Types Demonstrated

### 1. Boolean condition
```yaml
when: install_apache_flag
````

---

### 2. Multiple conditions

```yaml
when:
  - condition1
  - condition2
```

---

### 3. Complex condition

```yaml
when: condition1 and condition2
```

---

### 4. Registered variable condition

```yaml
when: result.stdout.find('hi') != -1
```

---

### 5. Loop condition

```yaml
when: item > 5
```

---

### 6. ansible_facts based condition

```yaml
when: ansible_facts['os_family'] == "Debian"
```

---

## How to run

```bash
ansible-playbook playbooks/ansible-conditionals-playbook.yaml
```

---

