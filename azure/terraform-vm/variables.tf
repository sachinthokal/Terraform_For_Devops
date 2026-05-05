variable "location" {
  type    = string
  default = "Central India"
}

variable "resource_group_name" {
  type    = string
  default = "terraform-rg"
}

variable "virtual_network_name" {
  type    = string
  default = "terraform-vnet"
}

variable "virtual_machine_name" {
  type    = string
  default = "terraform-linux-vm"
}

variable "admin_username" {
  type    = string
  default = "adminuser"
}

variable "ssh_public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}

variable "vm_size" {
  type    = string
  default = "Standard_D2s_v3"
}

variable "publisher_name" {
  type    = string
  default = "Canonical"
}

variable "publisher_offer" {
  type    = string
  default = "0001-com-ubuntu-server-jammy"
}

variable "publisher_sku" {
  type    = string
  default = "22_04-lts"
}

variable "publisher_version" {
  type    = string
  default = "latest"
}