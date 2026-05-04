# --- Terraform Settings Block ---
terraform {
  # 1. Define the Azure Provider and its version
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0" # Version locking (v3.x)
    }
  }

  # 2. Remote Backend (Best Practice: State file store to storage account)
  backend "azurerm" {
    resource_group_name  = "terraform-rg"
    storage_account_name = "tfstatestorage1799"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

# --- Azure Provider Configuration ---
provider "azurerm" {
  # This block is required. 'features'
  features { }
}