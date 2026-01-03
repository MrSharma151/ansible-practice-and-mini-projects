# ------------------------------------------------------------
# Networking Resources
# ------------------------------------------------------------
# This file defines basic networking components required
# for the Azure VM.
#
# Resources created here:
# - Virtual Network (VNet)
# - Subnet
#
# NOTE:
# - This is a minimal and clean setup for learning purposes.
# - Advanced networking (NSG, routing, etc.) will be added later.
# ------------------------------------------------------------

# ------------------------------------------------------------
# Virtual Network
# ------------------------------------------------------------
# A Virtual Network provides private networking space
# for Azure resources like virtual machines.
# ------------------------------------------------------------

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# ------------------------------------------------------------
# Subnet
# ------------------------------------------------------------
# A Subnet is a smaller network inside a Virtual Network.
# The VM will be placed inside this subnet.
# ------------------------------------------------------------

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_prefixes
}
