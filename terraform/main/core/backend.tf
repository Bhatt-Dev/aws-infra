terraform {
  backend "s3" {
    bucket       = var.remote_state_bucket
    key          = var.key
    region       = var.region
    use_lockfile = true
  }
}