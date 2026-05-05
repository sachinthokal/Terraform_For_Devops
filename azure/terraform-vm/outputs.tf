output "vm_name" {
  description = "Name of the Virtual Machine"
  value       = azurerm_linux_virtual_machine.terraform-vm.name
}

output "vm_public_ip" {
  description = "Public IP address of the Virtual Machine"
  value       = azurerm_public_ip.terraform-pip.ip_address
}

