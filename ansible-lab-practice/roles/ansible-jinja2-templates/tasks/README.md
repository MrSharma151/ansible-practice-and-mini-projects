# Ansible Jinja2 Templates Role

## Purpose
This role demonstrates how to use **Jinja2 templates**
in Ansible to dynamically generate configuration files
and content.

---

## What this role demonstrates
- Variable substitution in templates
- Conditional logic using `{% if %}`
- Looping using `{% for %}`
- Rendering templates on remote hosts

---

## Template Features Used

### Variable usage
```jinja2
{{ app_name }}

Conditional logic:
{% if enable_message %}
{% endif %}

Looping:
{% for user in users %}
{% endfor %}

How to run:
ansible-playbook playbooks/ansible-jinja2-templates-playbook.yaml
