# AWS Infrastructure Deployment with Terraform

This repository contains Terraform configurations for deploying and managing AWS infrastructure. It follows a modular structure to organize different components of the infrastructure.

## Folder Structure

- **main.tf**: Main Terraform configuration file where modules are instantiated and used.
- **variables.tf**: File containing input variables used in the Terraform configuration.
- **outputs.tf**: File containing output values exposed by the Terraform configuration.
- **modules/**: Directory containing sub-modules for different components of the infrastructure.
  - **s3/**: Module for creating an S3 bucket.
  - **kms/**: Module for creating a KMS key.
  - **iam/**: Module for creating IAM roles and policies.
  - **lambda/**: Directory containing sub-modules for uploader and retriever Lambda functions.
  - **cloudwatch/**: Module for configuring CloudWatch events and alarms.
  - **api_gateway/**: Module for setting up an API Gateway.
  - **alarms/**: Module for creating CloudWatch alarms.

## Deployment Instructions and Dependencies

1. Install Terraform: Make sure Terraform is installed on your system. You can download it from [Terraform's official website](https://www.terraform.io/downloads.html).
2. Clone this repository: `git clone https://github.com/landonbeard/aws-timestamp-service.git`
3. Navigate to the repository directory: `cd aws-timestamp-service`
4. Initialize Terraform: `terraform init`
5. Configure your AWS credentials: Ensure that your AWS access key and secret key are properly configured either through environment variables or AWS credentials file.
6. Modify variables: Update the `variables.tf` file with your desired values for deployment.
7. Deploy the infrastructure: Run `terraform apply` and confirm the changes.
8. Access deployed resources: Once the deployment is successful, access the deployed resources as per your requirements.

## Tear-down Instructions

To tear down the deployed infrastructure:

1. Navigate to the repository directory.
2. Run `terraform destroy` to tear down the infrastructure.
3. Confirm the destruction by typing `yes` when prompted.
4. Review the output to ensure all resources are successfully destroyed.

## Dependencies

- Terraform
- AWS CLI (for configuring AWS credentials)

Ensure you have appropriate permissions and configurations set up in your AWS account to deploy and manage the resources.

