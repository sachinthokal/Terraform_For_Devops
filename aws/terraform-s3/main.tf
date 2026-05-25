# S3 Bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket        = var.bucket_name
  force_destroy = false

  tags = {
    Name        = "Terraform State Storage"
    Environment = "Prod"
  }
}

# Bucket Versioning
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}