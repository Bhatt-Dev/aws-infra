output "hosted_zone_name" {
  value = data.aws_route53_zone.main.name
}