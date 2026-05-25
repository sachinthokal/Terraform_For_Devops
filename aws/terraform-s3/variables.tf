variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "bucket_name" {
  description = "S3 Bucket Should Be Unique"
  type        = string
  default     = "01-tf-state-bucket-2026"
}