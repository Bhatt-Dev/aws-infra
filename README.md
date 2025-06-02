# AWS Infrastructure Project

This project provides a complete pipeline setup for deploying infrastructure on AWS using Infrastructure as Code (IaC) principles.

## Features

- **CI/CD Pipeline:** Automated GitHub Actions workflow for testing, validating, and deploying AWS infrastructure.
- **Destroy Pipeline:** Manual workflow at `workflows/destroy.yml` to destroy provisioned resources.
- **Base AWS IaC:** Modular and reusable code for provisioning AWS resources.

## Getting Started

1. **Clone the Repository**
    ```bash
    git clone https://github.com/Bhatt-Dev/aws-infra.git
    cd aws-infra
    ```

2. **Configure AWS Credentials**
    - Set up your AWS credentials as environment variables or use the AWS CLI.

3. **Pipeline Setup**
    - The `.github/workflows/main.yml` file contains the CI/CD pipeline.
    - On every push or pull request, the pipeline will:
      - Lint and validate IaC code
      - Plan and apply changes to AWS
    - The `workflows/destroy.yml` file provides a manual workflow to destroy all created resources.

4. **IaC Code Structure**
    - All infrastructure code is located in the `terraform/` directory.
    - Uses [OpenTofu](https://opentofu.org/) (or your chosen IaC tool) for resource provisioning.

## Available Modules

Below is a list of available modules. Each module contains its own README in its directory.

| Name | Source | Version |
|------|--------|---------|
| <a name="/terraform/modules/terraform-aws-acm"></a> [acm](/terraform/modules/terraform-aws-vpc) | `terraform/modules/terraform-aws-acm` | 1.0.0 |
| <a name="/terraform/modules/terraform-aws-vpc"></a> [vpc](terraform/modules/terraform-aws-vpc) | `terraform/modules/terraform-aws-vpc` | 1.0.0 |


## Usage

- Modify the IaC modules in `terraform/` as needed.
- Push changes to trigger the pipeline and deploy updates to AWS.
- Use the manual destroy workflow to tear down resources when needed.

## License

[MIT](./LICENSE)
