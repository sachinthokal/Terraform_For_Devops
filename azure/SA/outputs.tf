output "storage_account_id" {
  value = azurerm_storage_account.storage.id
}

output "primary_blob_endpoint" {
  value = azurerm_storage_account.storage.primary_blob_endpoint
}

# Security sathi primary key sensitive thevli ahe
output "storage_primary_key" {
  value     = azurerm_storage_account.storage.primary_access_key
  sensitive = true
}