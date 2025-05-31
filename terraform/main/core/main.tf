data "aws_caller_identity" "current" {}

data "aws_route53_zone" "main" {
  name         = var.hosted_zone_name
  private_zone = false
}

module "acm" {
  source = "../../modules/terraform-aws-acm"

  domain_name             = var.hosted_zone_name
  additional_domain_names = ["*.${var.hosted_zone_name}"]
  hosted_zone_id          = data.aws_route53_zone.main.zone_id

  tags = {
    Name        = "${var.name}-${var.environment}-acm"
    Environment = var.environment
  }
}

module "vpc" {
  source = "../../modules/terraform-aws-vpc"

  name                 = var.name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

  tags = {
    Name        = "${var.name}-${var.environment}-vpc"
    Environment = var.environment
  }
}