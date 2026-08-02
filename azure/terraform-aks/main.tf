# 1. Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# 2. AKS Cluster with System Node Pool (Auto-scaling Enabled: 1 to 2 nodes)
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.aks_dns_prefix

  oidc_issuer_enabled = true

  # System Node Pool
  default_node_pool {
    name                = "systempool"
    vm_size             = var.vm_size
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 2
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Development"
    CreatedBy   = "Sachin Thokal"
    Date        = "2026-07-31"
    Email       = "sachinthokal1799@gmail.com"
  }
}

# 3. User Node Pool 1 (Auto-scaling Enabled: 1 to 2 nodes)
resource "azurerm_kubernetes_cluster_node_pool" "userpool1" {
  name                  = "userpool1"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.vm_size
  mode                  = "User"
  enable_auto_scaling   = true
  min_count             = 1
  max_count             = 2
}

# 4. User Node Pool 2 (Auto-scaling Enabled: 1 to 2 nodes)
resource "azurerm_kubernetes_cluster_node_pool" "userpool2" {
  name                  = "userpool2"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.vm_size
  mode                  = "User"
  enable_auto_scaling   = true
  min_count             = 1
  max_count             = 2
}

# Cluster Capacity and Scaling Configuration - 2 vCPUs, 8 GiB RAM per node
# 4 total nodes (1 system node + 1 user node in userpool1 + 2 user nodes in userpool2)
# 4 x 2 vCPUs = 8 vCPUs total
# 4 x 8 GiB RAM = 32 GiB RAM total
# Total Cluster Capacity: 8 vCPUs, 32 GiB RAM
# Auto-scaling per node - 1-2 nodes
