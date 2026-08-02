variable "aks_cluster_name" {
  description = "Name of the AKS Cluster"
  type        = string
  default     = "terraform-aks-cluster"
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
  default     = "terraform-rg"
}

variable "location" {
  description = "Azure region where the Resource Group will be created"
  type        = string
  default     = "Central India"
}

variable "vm_size" {
  description = "AKS Cluster Vm Size"
  type        = string
  default     = "Standard_D2s_v4" # Standard_D2s_v4 --> 2 vCPU, 8 GiB RAM
}

variable "aks_dns_prefix" {
  description = "DNS prefix for the AKS Cluster"
  type        = string
  default     = "terraform-aks"
}