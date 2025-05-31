variable "environment" {
  description = "The name of the environment (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "remote_state_bucket" {
  description = "The name of the S3 bucket for remote state storage"
  type        = string
  default     = "bhattdev-tofu-remote-state"
}

variable "AWS_REGION" {
  description = "The AWS region where resources will be created"
  type        = string
  default     = "ap-south-1"
}

variable "AWS_ACCOUNT_ID" {
  description = "The AWS Account ID where resource will be created"
  type        = string
}

variable "github_url" {
  description = "The URL of the GitHub repository for the project"
  type        = string
  default     = "https://github.com"
}

variable "github_organization" {
  description = "The GitHub organization name"
  type        = string
  default     = "Bhatt-Dev"
}