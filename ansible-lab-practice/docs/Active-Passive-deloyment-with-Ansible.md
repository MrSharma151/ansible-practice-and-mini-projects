

# Active–Passive Deployment Strategy with Ansible

## 1. Introduction & Overview

An **Active–Passive deployment strategy** is a widely adopted **high-availability (HA)** and **low-risk deployment model** where **two identical environments (or nodes)** are maintained, but **only one serves live production traffic at any given time**.

### Node Roles

* **Active Node**

  * Currently serves live user traffic
  * Hosts the production version of the application
* **Passive Node**

  * Fully provisioned and configured
  * Does **not** receive live traffic
  * Remains on standby, ready for immediate promotion

The passive node continuously mirrors the active environment so that it can **take over instantly** during failures, maintenance, or deployments.

---

## 2. Why Active–Passive Deployment?

Active–Passive is preferred when **stability, safety, and predictability** are more important than raw scalability.

### Key Objectives Achieved

* High Availability (HA)
* Near zero or zero downtime deployments
* Safe and reversible releases
* Disaster recovery readiness
* Controlled production changes

Unlike Active–Active models, **only one node handles traffic**, which dramatically reduces complexity and unexpected behavior.

---

## 3. Common Use Cases

Active–Passive deployment is especially suitable for:

* Web servers (Nginx / Apache)
* Backend application servers
* Primary–standby database architectures
* Stateful or session-dependent applications
* Legacy systems that cannot run in parallel
* Compliance-heavy or risk-sensitive environments

---

## 4. Conceptual Architecture

![Image](https://media.geeksforgeeks.org/wp-content/uploads/20240423165007/Active-Active-vs-Active-Passive-Architecture.webp)

![Image](https://www.skullbox.net/diagrams/active-passive-cluster.jpg)

![Image](https://media.geeksforgeeks.org/wp-content/uploads/20240509173005/Active-Passive-Architecture-%283%29.webp)

### Logical Flow

```
        ┌──────────────────┐
        │  Load Balancer   │
        └─────────┬────────┘
                  │
        ┌─────────┴─────────┐
        │                   │
┌───────▼────────┐ ┌────────▼────────┐
│   ACTIVE NODE   │ │  PASSIVE NODE   │
│ (Serving Live)  │ │ (Standby Ready) │
└─────────────────┘ └─────────────────┘
```

✔ Only the **Active Node** receives traffic
✔ The **Passive Node** remains isolated but fully operational

---

## 5. Core Components of Active–Passive Strategy

### 5.1 Active Node

* Handles all production traffic
* Connected to load balancer, DNS, or reverse proxy
* Runs stable and verified application version

### 5.2 Passive Node

* Identical configuration as active
* Runs same application version
* No production traffic
* Used for:

  * New deployments
  * Validation and testing
  * Failover readiness

### 5.3 Failover Mechanism

Failover occurs when:

* Active node crashes or becomes unhealthy
* Planned maintenance is required
* Deployment promotion is initiated
* Manual switch is triggered via automation

---

## 6. Role of Ansible in Active–Passive Deployment

Ansible acts as the **orchestration and control layer**, not the traffic router.

### What Ansible Handles

* Provisioning and configuration of both nodes
* Ensuring configuration parity
* Deploying application releases
* Running health and smoke tests
* Promoting passive → active
* Demoting active → passive
* Rolling back safely

### What Ansible Does NOT Do

* Route live traffic directly
* Replace load balancers or DNS
* Perform real-time request switching

👉 Instead, Ansible **coordinates infrastructure components** that handle traffic.

---

## 7. Inventory Design (Conceptual)

```ini
[active]
server1 ansible_host=10.0.0.10

[passive]
server2 ansible_host=10.0.0.11

[all:vars]
app_port=8080
```

### Why This Design?

* Clear separation of responsibilities
* Targeted playbook execution
* Reduced deployment risk
* Cleaner promotion and rollback logic

---

## 8. Role-Based Architecture (Best Practice)

```
roles/
├── common/         # OS setup, users, packages
├── app/            # Application deployment logic
├── health-check/   # Application & infra validation
├── active-switch/  # Traffic switching logic
└── rollback/       # Safe recovery mechanisms
```

Each role follows **single-responsibility principle**, improving maintainability and auditability.

---

## 9. Deployment Flow (High-Level)

### Step 1: Prepare Both Nodes

* Install OS dependencies
* Apply system hardening
* Configure runtime environment
* Ensure configuration consistency

---

### Step 2: Deploy to Passive Node (Golden Rule)

* Deploy new application version
* Update configs
* Restart services
* Keep active node untouched

✔ Zero risk to live traffic

---

### Step 3: Validate Passive Node

* Health endpoint checks
* Port availability checks
* Application status verification
* Optional smoke tests

Deployment **must not proceed** if validation fails.

---

### Step 4: Switch Traffic

Traffic switching depends on infrastructure:

* Load balancer backend update
* DNS record change
* Reverse proxy config toggle
* Firewall or routing rule update

---

### Step 5: Promote Passive to Active

* Passive node becomes live
* Old active node is demoted
* System returns to steady state

---

## 10. Example Playbook Flow (Conceptual)

```yaml
- name: Deploy application to passive node
  hosts: passive
  roles:
    - app
    - health-check

- name: Switch active node
  hosts: localhost
  roles:
    - active-switch
```

✔ Live traffic remains unaffected
✔ Promotion happens only after validation success

---

## 11. Failover Strategy

### Automatic Failover

* Triggered by monitoring alerts
* Integrated with monitoring tools
* Requires careful safeguards

### Manual Failover (Preferred for Critical Systems)

* Triggered via Ansible playbooks
* Fully controlled and auditable
* Reduced blast radius

---

## 12. Rollback Strategy

Rollback in Active–Passive is **clean and predictable**:

1. Switch traffic back to old active node
2. Investigate and fix issues
3. Redeploy safely to passive
4. Reattempt promotion

✔ No partial rollback
✔ No user impact

---

## 13. Advantages

* Extremely safe deployments
* Simple mental model
* Easy rollback
* Minimal downtime
* Predictable behavior
* Ideal for production environments

---

## 14. Disadvantages

* Resource underutilization
* Only one node serves traffic
* Slightly slower failover compared to Active–Active

---

## 15. Best Practices

* Keep configurations identical
* Always deploy to passive first
* Automate health checks
* Externalize configuration with variables
* Log and audit all switch actions
* Never deploy directly to active

---

## 16. Common Mistakes to Avoid

* Deploying directly on active node
* Skipping passive validation
* Manual configuration drift
* Hardcoding active/passive logic
* No rollback automation

---

## 17. Interview-Ready Talking Points ⭐

* Active–Passive means **one live, one standby**
* Traffic handled by only one node
* Ansible orchestrates deployment, not traffic
* Safer than Active–Active for stateful apps
* Ideal for controlled production rollouts

---

## 18. When to Choose Active–Passive

Choose this strategy when:

* Application is stateful
* Stability > scalability
* Zero downtime is required
* Infrastructure simplicity is preferred
* Production safety is critical

---

## 19. Final Summary

* Active–Passive is a **reliable and proven HA model**
* Ansible enables **safe, repeatable orchestration**
* Passive-first deployment minimizes production risk
* Ideal foundation for enterprise DevOps automation
* Strongly aligned with real-world production practices

---

