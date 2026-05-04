# --- Resource Group Variables ---

variable "resource_group_name" {
  description = "Name of the resource group where resources will be created"
  type        = string
  default     = "terraform-vm-rg"
}

variable "location" {
  description = "Azure region for the deployment"
  type        = string
  default     = "East US"
}

# --- Networking Variables ---

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
  default     = "main-vnet"
}

variable "vnet_address_space" {
  description = "IP address space for the VNet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the subnet within the VNet"
  type        = string
  default     = "internal-subnet"
}

variable "subnet_prefix" {
  description = "Address prefix for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

# --- Virtual Machine Variables ---

variable "vm_name" {
  description = "The name of the Virtual Machine"
  type        = string
  default     = "simple-vm-01"
}

variable "vm_size" {
  description = "The SKU/Size of the VM (e.g., Standard_B1s, Standard_F2)"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "admin_username" {
  description = "Username for the VM administrator"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Local path to the SSH public key for authentication"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

# --- OS Image Variables ---

variable "os_publisher" {
  description = "Publisher of the OS image"
  type        = string
  default     = "Canonical"
}

variable "os_offer" {
  description = "The OS offering (e.g., UbuntuServer)"
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
}

variable "os_sku" {
  description = "The SKU of the OS (e.g., 22_04-lts)"
  type        = string
  default     = "22_04-lts"
}