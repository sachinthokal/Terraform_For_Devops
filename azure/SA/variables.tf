variable "resource_group_name" {
  type    = string
  default = "terraform-storage-rg"
}

variable "location" {
  type    = string
  default = "East US"
}

variable "storage_account_name" {
  type    = string
  default = "sachinstore2026v1"
}

variable "storage_tier" {
  type    = string
  default = "Standard"
}

variable "replication_type" {
  type    = string
  default = "LRS"
}