data "aws_caller_identity" "current" {}

data "terraform_remote_state" "core" {
  backend = "s3"
  config = {
    bucket = var.remote_state_bucket
    key    = var.key
    region = var.region
  }
}

data "aws_route53_zone" "main" {
  name         = data.terraform_remote_state.core.outputs.hosted_zone_name
  private_zone = false
}