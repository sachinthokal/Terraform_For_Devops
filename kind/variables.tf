variable "cluster_name" {
  description = "The name of the Kind cluster"
  type        = string
  default     = "terraform-cluster"
}

variable "cluster_ports" {
  type = list(object({
    container_port = number
    host_port      = number
    protocol       = string
  }))
  default = [
    { container_port = 30080, host_port = 8080, protocol = "TCP" },
    { container_port = 30081, host_port = 8081, protocol = "TCP" },
    { container_port = 30082, host_port = 8082, protocol = "TCP" },
    { container_port = 30083, host_port = 8083, protocol = "TCP" }
  ]
}

variable "node_image" {
  description = "The Kind node image to use for all nodes"
  type        = string
  default     = "kindest/node:v1.35.0"
}