# --- VM Public IP Output ---
output "vm_public_ip" {
  description = "The public IP address of the newly created VM"
  value = azurerm_public_ip.pip.ip_address
}

# --- VM Private IP Output ---
output "vm_private_ip" {
  description = "The private IP address of the VM"
  value       = azurerm_network_interface.nic.private_ip_address
}

# --- Resource Group ID ---
output "resource_group_id" {
  description = "The ID of the resource group"
  value       = azurerm_resource_group.rg.id
}