# 1. Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# 2. Create Storage Account
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.storage_tier
  account_replication_type = var.replication_type

  tags = {
    environment = "dev"
    owner       = "Sachin"
  }
}

# 3. Create a Container (Optional - files thevnyasathi)
resource "azurerm_storage_container" "container" {
  name                  = "tfstate-container"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}