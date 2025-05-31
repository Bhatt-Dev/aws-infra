locals {
  distinct_domain_names = distinct(concat(
    [var.domain_name],
    [for domain in var.additional_domain_names : replace(domain, "*.", "")],
  ))

  validation_domains = [for k, v in aws_acm_certaws_acm_certificate.this[0].domain_validation_options : tomap(v) if contains(local.distinct_domain_names, v.domain_name)]
}

resource "aws_acm_certificate" "this" {
  count = var.create_certificate ? 1 : 0

  domain_name               = var.domain_name
  subject_alternative_names = var.additional_domain_names
  validation_method         = var.validation_method

  tags = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "validation" {
  count = var.create_certificate && var.validation_method == "DNS" ? length(local.distinct_domain_names) : 0

  zone_id = var.hosted_zone_id
  name    = local.validation_domains[count.index].resource_record_name
  type    = local.validation_domains[count.index].resource_record_type
  ttl     = 60
  records = [local.validation_domains[count.index].resource_record_value]

  allow_overwrite = true

  depends_on = [aws_acm_certificate.this]
}

resource "aws_acm_certificate_validation" "this" {
  count = var.create_certificate && var.validation_method == "DNS" ? 1 : 0

  certificate_arn = aws_acm_certificate.this[0].arn

  validation_record_fqdns = aws_route53_record.validation.*.fqdn

  depends_on = [aws_route53_record.validation]
}