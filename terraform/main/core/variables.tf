variable "remote_state_bucket" {
  description = "The name of the S3 bucket for remote state storage"
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

variable "hosted_zone_name" {
  description = "The name of the Route 53 hosted zone"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones in the region"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}