# 1. SSH Key Pair
resource "aws_key_pair" "deployer" {
  key_name   = "my-ec2-key"
  public_key = file(var.ssh_key)
}

# 2. Security Group (Opens 22, 80, 443)
resource "aws_security_group" "web_traffic" {
  name        = "allow_web_and_ssh"
  description = "Allow SSH, HTTP, and HTTPS traffic"

  # SSH (Port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP (Port 80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS (Port 443)
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rules (Allow instance to talk to the internet)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 3. EC2 Instance
resource "aws_instance" "my_simple_ec2" {
  ami                    = var.ami_id # Ubuntu 22.04 LTS
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.web_traffic.id]

  tags = {
    Name = var.instance_name
  }
}

