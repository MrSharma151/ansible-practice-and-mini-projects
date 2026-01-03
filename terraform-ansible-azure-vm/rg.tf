# ------------------------------------------------------------
# Resource Group Definition
# ------------------------------------------------------------
# This file is responsible for creating an Azure Resource Group.
# All other Azure resources (VM, network, etc.) will be created
# inside this resource group.
#
# NOTE:
# - This resource group is only for learning and practice.
# - After the tutorial, we will destroy it using `terraform destroy`
# ------------------------------------------------------------

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
