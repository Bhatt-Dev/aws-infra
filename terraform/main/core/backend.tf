terraform {
  backend "s3" {
    bucket       = "bhattdev-tofu-remote-state-dev"
    key          = "dev/core/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}