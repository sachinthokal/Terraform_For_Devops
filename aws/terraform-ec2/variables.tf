variable "instance_name" {
  description = "Value for the Name tag of the EC2 instance"
  type        = string
  default     = "terraform-ec2-01"
}

variable "aws_region" {
  description = "The AWS region to deploy resources into"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "The size of the EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "ssh_key" {
  description = "SSH KEY FOR EC2"
  default     = "~/.ssh/id_rsa.pub"
}

variable "ami" {
  description = "ami image id"
  type        = string
  default     = "ami-07a00cf47dbbc844c"
}
