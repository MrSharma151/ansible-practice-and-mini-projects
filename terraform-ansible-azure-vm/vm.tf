# ------------------------------------------------------------
# Virtual Machine + Network Interface
# ------------------------------------------------------------
# This file creates:
# - Public IP address
# - Network Interface (NIC)
# - Linux Virtual Machine
#
# NOTE:
# - This VM will be used as a remote host for Ansible practice.
# - SSH access is enabled using an SSH public key.
# - VM size is kept small to minimize cost.
# ------------------------------------------------------------

# ------------------------------------------------------------
# Public IP Address
# ------------------------------------------------------------
# A public IP is required so that we can SSH into the VM
# from our local machine (WSL Ubuntu).
# ------------------------------------------------------------

resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
 
  allocation_method = "Static"
  sku               = "Standard"
}

# ------------------------------------------------------------
# Network Interface (NIC)
# ------------------------------------------------------------
# The NIC connects the VM to:
# - Subnet
# - Public IP
# - Network Security Group (NSG)
# ------------------------------------------------------------

resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

# ------------------------------------------------------------
# Associate NSG with NIC
# ------------------------------------------------------------
# This ensures that the SSH rule defined in the NSG
# is applied to the VM.
# ------------------------------------------------------------

resource "azurerm_network_interface_security_group_association" "nic_nsg_assoc" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# ------------------------------------------------------------
# Linux Virtual Machine
# ------------------------------------------------------------
# This VM will act as a remote host for Ansible.
# We use SSH key authentication (no passwords).
# ------------------------------------------------------------

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  size                = var.vm_size

  admin_username = var.vm_admin_username

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  # ----------------------------------------------------------
  # SSH Authentication
  # ----------------------------------------------------------
  # We use an SSH public key for secure, passwordless login.
  # ----------------------------------------------------------

  admin_ssh_key {
    username   = var.vm_admin_username
    public_key = file(var.ssh_public_key_path)
  }

  # ----------------------------------------------------------
  # OS Disk Configuration
  # ----------------------------------------------------------

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # ----------------------------------------------------------
  # OS Image (Ubuntu 22.04 LTS)
  # ----------------------------------------------------------

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
