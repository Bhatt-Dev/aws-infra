## Environment Setup

This section is used to set up different environments, such as development, production, testing, etc. Currently, it contains code for setting up the **dev** environment only. However, you can copy the same configuration and change references from `dev` to `prod` or `test` as needed to deploy to a new environment.

> **Note:** Workflows are not configured to automatically run the environment setup. You must perform the setup manually.

The current requirements, providers, and resources are listed below.

---

### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.99.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.99.0 |


### Resources

| Name | Type |
|------|------|
| [aws_iam_policy.bhattdev_tf_state_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/5.99.0/docs/resources/iam_policy) | resource |
| [aws_iam_role.bhattdev_github_actions_role](https://registry.terraform.io/providers/hashicorp/aws/5.99.0/docs/resources/iam_role) | resource |
| [aws_iam_role.bhattdev_tf_state_role](https://registry.terraform.io/providers/hashicorp/aws/5.99.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.attach_s3_policy](https://registry.terraform.io/providers/hashicorp/aws/5.99.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.bhattdev_github_actions_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/5.99.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_s3_bucket.bhattdev_tf_state_bucket](https://registry.terraform.io/providers/hashicorp/aws/5.99.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.bhattdev_tf_state_bucket_encryption](https://registry.terraform.io/providers/hashicorp/aws/5.99.0/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.bhattdev_tf_state_bucket_versioning](https://registry.terraform.io/providers/hashicorp/aws/5.99.0/docs/resources/s3_bucket_versioning) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/5.99.0/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.bhattdev_tf_state_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/5.99.0/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/5.99.0/docs/data-sources/region) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_AWS_ACCOUNT_ID"></a> [AWS\_ACCOUNT\_ID](#input\_AWS\_ACCOUNT\_ID) | The AWS Account ID where resource will be created | `string` | n/a | yes |
| <a name="input_AWS_REGION"></a> [AWS\_REGION](#input\_AWS\_REGION) | The AWS region where resources will be created | `string` | `"ap-south-1"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The name of the environment (e.g., dev, staging, prod) | `string` | `"dev"` | no |
| <a name="input_github_organization"></a> [github\_organization](#input\_github\_organization) | The GitHub organization name | `string` | `"Bhatt-Dev"` | no |
| <a name="input_github_url"></a> [github\_url](#input\_github\_url) | The URL of the GitHub repository for the project | `string` | `"https://github.com"` | no |
| <a name="input_remote_state_bucket"></a> [remote\_state\_bucket](#input\_remote\_state\_bucket) | The name of the S3 bucket for remote state storage | `string` | `"bhattdev-tofu-remote-state"` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_github_access_role_arn"></a> [github\_access\_role\_arn](#output\_github\_access\_role\_arn) | The ARN of the GitHub Actions role |


## Next Steps
### Setting Up GitHub Environments and Secrets

To enable deployments from GitHub Actions, you need to configure a GitHub Environment (such as `development`, `production`, etc.) and add the required secrets for each environment.

**Steps:**

1. In your GitHub repository, go to **Settings** > **Environments** and create a new environment (e.g., `development` for `dev`, `production` for `prod`).
2. For each environment, add the following secrets:
   - `AWS_ACCOUNT_ID`: The AWS Account ID where resources will be created.
   - `AWS_GITHUB_ROLE_ARN`: The ARN of the IAM Role that GitHub Actions will assume.

**Example:**

For the `development` environment:
- Secret Name: `AWS_ACCOUNT_ID`
  Secret Value: `123456789012`
- Secret Name: `AWS_GITHUB_ROLE_ARN`
  Secret Value: `arn:aws:iam::123456789012:role/bhattdev_github_actions_role`