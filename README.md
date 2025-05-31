# AWS Infrastructure Project

This project provides a complete pipeline setup for deploying infrastructure on AWS using Infrastructure as Code (IaC) principles.

## Features

- **CI/CD Pipeline:** Automated GitHub Actions workflow for testing, validating, and deploying AWS infrastructure.
- **Base AWS IaC:** Modular and reusable code for provisioning AWS resources.

## Getting Started

1. **Clone the Repository**
    ```bash
    git clone https://github.com/your-username/aws-infra.git
    cd aws-infra
    ```

2. **Configure AWS Credentials**
    - Set up your AWS credentials as environment variables or use the AWS CLI.

3. **Pipeline Setup**
    - The `.github/workflows/deploy.yml` file contains the CI/CD pipeline.
    - On every push or pull request, the pipeline will:
      - Lint and validate IaC code
      - Plan and apply changes to AWS

4. **IaC Code Structure**
    - All infrastructure code is located in the `infra/` directory.
    - Uses [Terraform](https://www.terraform.io/) (or your chosen IaC tool) for resource provisioning.

## Usage

- Modify the IaC modules in `infra/` as needed.
- Push changes to trigger the pipeline and deploy updates to AWS.

## License

MIT
