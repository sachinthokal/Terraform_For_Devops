# 1. Resource Group
resource "azurerm_resource_group" "terraform-rg" {
  name     = var.resource_group_name
  location = var.location
} 


# 2. Virtual Network
resource "azurerm_virtual_network" "terraform-vnet" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
}

# 3. Subnet
resource "azurerm_subnet" "terraform-subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.terraform-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}