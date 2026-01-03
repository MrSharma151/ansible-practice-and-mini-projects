# ------------------------------------------------------------
# Input Variables
# ------------------------------------------------------------
# This file defines all variables used in the Terraform project.
# Values for these variables will be provided via terraform.tfvars
# ------------------------------------------------------------

# Azure region where resources will be created
variable "location" {
  description = "Azure region for all resources"
  type        = string
}

# Name of the Azure Resource Group
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

# ------------------------------------------------------------
# Networking Variables
# ------------------------------------------------------------

# Virtual Network name
variable "vnet_name" {
  description = "Name of the Azure Virtual Network"
  type        = string
}

# Address space for the Virtual Network
variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
}

# Subnet name
variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

# Address prefixes for the subnet
variable "subnet_address_prefixes" {
  description = "Address prefixes for the subnet"
  type        = list(string)
}

# ------------------------------------------------------------
# Network Security Group Variables
# ------------------------------------------------------------

# Name of the Network Security Group
variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
}

# ------------------------------------------------------------
# Virtual Machine Variables
# ------------------------------------------------------------

variable "vm_name" {
  description = "Name of the Azure Virtual Machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the Azure Virtual Machine"
  type        = string
}

variable "vm_admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key used for VM login"
  type        = string
}

# ------------------------------------------------------------
# Network Interface & Public IP Variables
# ------------------------------------------------------------

variable "nic_name" {
  description = "Name of the Network Interface"
  type        = string
}

variable "public_ip_name" {
  description = "Name of the Public IP resource"
  type        = string
}
