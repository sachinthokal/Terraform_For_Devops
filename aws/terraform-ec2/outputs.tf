output "instance_name" {
  description = "Value for the Name tag of the EC2 instance"
  value       = aws_instance.my_simple_ec2.tags["Name"]
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.my_simple_ec2.id
}

output "instance_ip" {
  value       = aws_instance.my_simple_ec2.public_ip
  description = "Use this IP to SSH or visit via browser"
}