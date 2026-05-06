output "virtual_network_name" {
  value = azurerm_virtual_network.terraform-vnet.name
} 

output "subnet_name" {
  value = azurerm_subnet.terraform-subnet.name
} 