# ------------------------------------------------------------
# Variable Values
# ------------------------------------------------------------
# This file assigns values to variables declared in variables.tf
# It keeps configuration separate from code.
# ------------------------------------------------------------

# Azure region (choose any region you prefer)
location = "East US"

# Resource group name for Ansible + Terraform practice
resource_group_name = "rg-ansible-terraform-lab"

# ------------------------------------------------------------
# Networking Values
# ------------------------------------------------------------

vnet_name = "ansible-vnet"

vnet_address_space = [
  "10.0.0.0/16"
]

subnet_name = "ansible-subnet"

subnet_address_prefixes = [
  "10.0.1.0/24"
]

# ------------------------------------------------------------
# Network Security Group Values
# ------------------------------------------------------------

nsg_name = "ansible-nsg"

# ------------------------------------------------------------
# Virtual Machine Values
# ------------------------------------------------------------

vm_name           = "ansible-vm"
vm_size           = "Standard_B1s"
vm_admin_username = "azureuser"

# Path to your SSH public key on WSL Ubuntu
ssh_public_key_path = "/home/mrsharma/.ssh/id_rsa.pub"

# ------------------------------------------------------------
# Network Interface & Public IP Values
# ------------------------------------------------------------

nic_name       = "ansible-nic"
public_ip_name = "ansible-public-ip"
