## AWS Certificate Manager (ACM)

This Terraform module provisions an AWS Certificate Manager (ACM) SSL certificate for a specified domain name and its subdomains. It automates the creation and DNS validation of the certificate using Route 53, ensuring the certificate is associated with the provided hosted zone. This enables secure HTTPS communication for your domain and its subdomains.

### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |


### Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_route53_record.validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_domain_names"></a> [additional\_domain\_names](#input\_additional\_domain\_names) | List of additional domain names for the VPC | `list(string)` | `[]` | no |
| <a name="input_create_certificate"></a> [create\_certificate](#input\_create\_certificate) | Flag to create an ACM certificate | `bool` | `true` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | List of domain names for the VPC | `string` | n/a | yes |
| <a name="input_hosted_zone_id"></a> [hosted\_zone\_id](#input\_hosted\_zone\_id) | The ID of the Route 53 hosted zone | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the resources | `map(string)` | `{}` | no |
| <a name="input_validation_method"></a> [validation\_method](#input\_validation\_method) | The validation method for the ACM certificate | `string` | `"DNS"` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_acm_certificate_arn"></a> [acm\_certificate\_arn](#output\_acm\_certificate\_arn) | The ARN of the ACM certificate. |