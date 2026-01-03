# ------------------------------------------------------------
# Network Security Group (NSG)
# ------------------------------------------------------------
# This file defines security rules for the virtual machine.
# An NSG works like a firewall in Azure.
#
# In this learning setup:
# - We allow inbound SSH (port 22)
# - This is required for Ansible to connect to the VM
#
# NOTE:
# - For production, source IPs should be restricted.
# - For learning, we allow SSH from anywhere.
# ------------------------------------------------------------

# ------------------------------------------------------------
# Network Security Group
# ------------------------------------------------------------

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  # ----------------------------------------------------------
  # Allow SSH Inbound Rule
  # ----------------------------------------------------------
  security_rule {
    name                       = "allow-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "22"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
  }
}
