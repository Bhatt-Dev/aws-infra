variable "domain_name" {
  description = "List of domain names for the VPC"
  type        = string
}

variable "additional_domain_names" {
  description = "List of additional domain names for the VPC"
  type        = list(string)
  default     = []
}

variable "hosted_zone_id" {
  description = "The ID of the Route 53 hosted zone"
  type        = string
}

variable "create_certificate" {
  description = "Flag to create an ACM certificate"
  type        = bool
  default     = true
}

variable "validation_method" {
  description = "The validation method for the ACM certificate"
  type        = string
  default     = "DNS"
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {}

}