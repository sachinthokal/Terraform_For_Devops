output "bucket_arn" {
  description = "S3 Bucket ARN"
  value       = aws_s3_bucket.my_bucket.arn
}

output "bucket_name" {
  description = "S3 Bucket Name"
  value       = aws_s3_bucket.my_bucket.id
}