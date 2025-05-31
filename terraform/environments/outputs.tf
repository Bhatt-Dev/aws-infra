output "github_access_role_arn" {
  description = "The ARN of the GitHub Actions role"
  value       = aws_iam_role.bhattdev_github_actions_role.arn
}

output "tf_state_bucket_arn" {
  description = "The name of the S3 bucket for Terraform remote state"
  value       = aws_s3_bucket.bhattdev_tf_state_bucket.arn
}