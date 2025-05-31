terraform {
  required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.99.0"
    }
  }
}

provider "aws" {
  region = var.AWS_REGION

  default_tags {
    tags = {
      Environment = var.environment
      Project     = "bhattdev"
      Owner       = "Anurag Bhatt"
      Terraform   = "true"
      Module      = "environments"
    }
  }
}