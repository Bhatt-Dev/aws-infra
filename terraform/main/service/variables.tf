variable "remote_state_bucket" {
  description = "The name of the S3 bucket for remote state storage"
  type        = string
}

variable "key" {
  description = "The key for the remote state file in the S3 bucket"
  type        = string
}

variable "region" {
  description = "The AWS region where the remote state bucket is located"
  type        = string
  default     = "ap-south-1"
}

variable "name" {
  description = "The name of the environment"
  type        = string
  default     = "BhattDev"
}

variable "environment" {
  description = "The environment for which the Terraform configuration is being applied"
  type        = string
}