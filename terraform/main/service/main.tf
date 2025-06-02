data "aws_caller_identity" "current" {}

data "terraform_remote_state" "core" {
  backend = "s3"
  config = {
    bucket       = var.remote_state_bucket
    key          = var.remote_state_key
    region       = var.region
    use_lockfile = true
  }
}

data "aws_route53_zone" "main" {
  name         = data.terraform_remote_state.core.output.hosted_zone_name
  private_zone = false
}