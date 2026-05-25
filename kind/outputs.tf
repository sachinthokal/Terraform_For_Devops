output "cluster_name" {
  value = kind_cluster.default.name
}

output "cluster_ports" {
  value = var.cluster_ports
}

output "cluster_node_version" {
  value = var.node_image
}