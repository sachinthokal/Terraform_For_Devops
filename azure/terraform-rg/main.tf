# 1. Resource Group
resource "azurerm_resource_group" "terraform-rg" {
  name     = var.resource_group_name
  location = var.location
}