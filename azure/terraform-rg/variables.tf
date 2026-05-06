variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
  default     = "terraform-rg"
}

variable "location" {
  description = "Azure region where the Resource Group will be created"
  type        = string
  default     = "East US"
}

