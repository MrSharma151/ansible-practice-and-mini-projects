# ------------------------------------------------------------
# Terraform Provider Configuration
# ------------------------------------------------------------
# This file defines:
# - Which cloud provider Terraform should use
# - Which provider version is required
#
# NOTE:
# - We are NOT using any remote backend (like Azure Storage)
# - State file will remain local (terraform.tfstate)
# - This is perfectly fine for learning and practice
# ------------------------------------------------------------

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# ------------------------------------------------------------
# Azure Provider Configuration
# ------------------------------------------------------------
# The azurerm provider allows Terraform to manage Azure resources.
# Authentication will be handled automatically using Azure CLI
# (az login), so no credentials are hardcoded here.
# ------------------------------------------------------------

provider "azurerm" {
  features {}
}
