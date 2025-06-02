## Core Initialization

This section describes the core setup for your AWS infrastructure using Terraform. The core initialization includes provisioning essential resources such as VPC and ACM. In future versions, additional components like Route 53, ECS Cluster, and MongoDB Project will be included.

> **Note:**
Currently, version 1 provisions only the ACM and VPC modules.

### Deployment

To deploy for the **dev** environment, the configuration uses `backend/dev.tfbackend` and `vars/dev.tfvars`.
If you want to deploy for other environments (such as **prod** or **test**), add corresponding backend and variable files (e.g., `backend/prod.tfbackend`, `vars/prod.tfvars`) and update your deployment commands accordingly.

The requirements, providers, modules, resources, inputs, and outputs for this configuration are detailed below.

---

### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.99.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.99.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acm"></a> [acm](#module\_acm) | ../../modules/terraform-aws-acm | 1.0.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ../../modules/terraform-aws-vpc | 1.0.0 |

### Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_route53_zone.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | List of availability zones in the region | `list(string)` | <pre>[<br/>  "ap-south-1a",<br/>  "ap-south-1b"<br/>]</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment for which the Terraform configuration is being applied | `string` | n/a | yes |
| <a name="input_hosted_zone_name"></a> [hosted\_zone\_name](#input\_hosted\_zone\_name) | The name of the Route 53 hosted zone | `string` | n/a | yes |
| <a name="input_key"></a> [key](#input\_key) | The key for the remote state file in the S3 bucket | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the environment | `string` | `"BhattDev"` | no |
| <a name="input_private_subnet_cidrs"></a> [private\_subnet\_cidrs](#input\_private\_subnet\_cidrs) | List of CIDR blocks for private subnets | `list(string)` | n/a | yes |
| <a name="input_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#input\_public\_subnet\_cidrs) | List of CIDR blocks for public subnets | `list(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region where the remote state bucket is located | `string` | `"ap-south-1"` | no |
| <a name="input_remote_state_bucket"></a> [remote\_state\_bucket](#input\_remote\_state\_bucket) | The name of the S3 bucket for remote state storage | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The CIDR block for the VPC | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_acm_certificate_arn"></a> [acm\_certificate\_arn](#output\_acm\_certificate\_arn) | ARN of the ACM certificate |
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | List of private subnet IDs |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | List of public subnet IDs |
| <a name="hosted_zone_name"></a> [hosted\_zone\_name](#hosted\_zone\_name) | Hosted Zone Name / Domain Name |
| <a name=""></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
