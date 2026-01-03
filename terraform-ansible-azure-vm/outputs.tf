# ------------------------------------------------------------
# Terraform Outputs
# ------------------------------------------------------------
# This file exposes important resource details after
# `terraform apply`.
#
# These outputs are useful for:
# - Verification
# - Learning and debugging
# - Passing values to tools like Ansible
# ------------------------------------------------------------

# ------------------------------------------------------------
# Resource Group Outputs
# ------------------------------------------------------------

output "resource_group_name" {
  description = "Name of the Azure Resource Group"
  value       = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  description = "Location of the Azure Resource Group"
  value       = azurerm_resource_group.rg.location
}

# ------------------------------------------------------------
# Networking Outputs
# ------------------------------------------------------------

output "virtual_network_name" {
  description = "Name of the Virtual Network"
  value       = azurerm_virtual_network.vnet.name
}

output "subnet_name" {
  description = "Name of the Subnet"
  value       = azurerm_subnet.subnet.name
}

output "network_security_group_name" {
  description = "Name of the Network Security Group"
  value       = azurerm_network_security_group.nsg.name
}

# ------------------------------------------------------------
# Virtual Machine Outputs
# ------------------------------------------------------------

output "virtual_machine_name" {
  description = "Name of the Azure Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.name
}

output "virtual_machine_size" {
  description = "Size of the Azure Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.size
}

output "vm_public_ip" {
  description = "Public IP address of the Ansible practice VM"
  value       = azurerm_public_ip.public_ip.ip_address
}
