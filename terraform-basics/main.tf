terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1" 
}

# Task 3: S3 Bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "terraweek-devops-sachin-thokal-2026"
}

# Task 4: EC2 Instance
resource "aws_instance" "my_server" {
  ami           = "ami-0522ab6e1ddcc7055" # Amazon Linux 2023 AMI for ap-south-1
  instance_type = "t3.micro"

  tags = {
    Name = "TerraWeek-server"
  }
}