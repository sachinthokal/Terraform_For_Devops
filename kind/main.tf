resource "kind_cluster" "default" {
  name           = var.cluster_name
  wait_for_ready = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    # Control Plane Node with your Port Mappings
    node {
      role  = "control-plane"
      image = var.node_image

      # ---- Dynamic Port Mappings ----
      dynamic "extra_port_mappings" {
        for_each = var.cluster_ports
        content {
          container_port = extra_port_mappings.value.container_port
          host_port      = extra_port_mappings.value.host_port
          protocol       = extra_port_mappings.value.protocol
        }
      }
      # ------------------------------------
    }

    # Worker Node 1
    node {
      role  = "worker"
      image = var.node_image
    }

    # Worker Node 2
    node {
      role  = "worker"
      image = var.node_image
    }
  }
}