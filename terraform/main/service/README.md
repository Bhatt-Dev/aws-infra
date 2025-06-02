## Core Initialization

This section describes the services for your AWS infrastructure using Terraform.

### Deployment

To deploy for the **dev** environment, the configuration uses `backend/dev.tfbackend` and `vars/dev.tfvars`.
If you want to deploy for other environments (such as **prod** or **test**), add corresponding backend and variable files (e.g., `backend/prod.tfbackend`, `vars/prod.tfvars`) and update your deployment commands accordingly.

The requirements, providers, modules, resources, inputs, and outputs for this configuration are detailed below.

> **Note:** Core Setup should be deployed first, by editing the workflow to target only Core.

> If Core is not deployed, then data from core output cannot be used as input in services.

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
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_route53_zone.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [terraform_remote_state.core](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The environment for which the Terraform configuration is being applied | `string` | n/a | yes |
| <a name="input_key"></a> [key](#input\_key) | The key for the remote state file in the S3 bucket | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the environment | `string` | `"BhattDev"` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region where the remote state bucket is located | `string` | `"ap-south-1"` | no |
| <a name="input_remote_state_bucket"></a> [remote\_state\_bucket](#input\_remote\_state\_bucket) | The name of the S3 bucket for remote state storage | `string` | n/a | yes |

### Outputs

No outputs.