output "acm_certificate_arn" {
  value       = aws_acm_certificate.this[0].arn
  description = "The ARN of the ACM certificate."
}