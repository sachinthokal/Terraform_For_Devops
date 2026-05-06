variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
  default     = "terraform-rg"
}

variable "location" {
  description = "Azure region where the Resource Group will be created"
  type        = string
  default     = "Central US"
}

variable "aks_cluster_name" {
  description = "Name of the AKS Cluster"
  type        = string
  default     = "terraform-aks-cluster"
}

variable "aks_dns_prefix" {
  description = "DNS prefix for the AKS Cluster"
  type        = string
  default     = "terraform-aks"
}
