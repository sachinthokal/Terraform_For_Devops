variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
  default     = "terraform-vnet"
}

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
  default     = "terraform-subnet"
}

variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "terraform-rg"
}