# **TechTVM-Tasks Terraform Configuration**

This repository contains Terraform code that creates AWS EC2, S3, and RDS resources. 

## Prerequisites

To use this Terraform configuration, you'll need:

- An AWS account with administrative privileges
- The [Terraform CLI](https://www.terraform.io/downloads.html) installed on your machine

## Usage

1. Clone the repository using the command `git clone https://github.com/MShanavas/TechTVM-Tasks.git`.
2. Navigate to the `terraform` directory using `cd TechTVM-Tasks/terraform`.
3. Set your AWS IAM access key and secret key, and RDS database password as environment variables: (terraform.tfvars) 
4. Run `terraform init` to initialize the Terraform configuration.
5. Run `terraform plan` to preview the resources that Terraform will create.
6. Run `terraform apply` to create the resources.
7. After Terraform has finished creating the resources, you can view the instance ID, public IP address of the EC2 instance, and RDS endpoint by running `terraform output`.

## Variables

The following variables are defined in `variables.tf`:

| Variable Name | Description |
| ------------- | ----------- |
| `ec2_name` | Name of the EC2 instance |
| `ec2_tags` | Additional tags to apply to the EC2 instance |
| `s3_bucket_name` | Name of the S3 bucket |
| `rds_name` | Name of the RDS instance |
| `rds_tags` | Additional tags to apply to the RDS instance |
| `rds_engine` | Database engine for the RDS instance |
| `rds_engine_version` | Database engine version for the RDS instance |
| `rds_instance_class` | Instance class for the RDS instance |

You can override these variables in `terraform.tfvars` or by passing them as command-line arguments when running `terraform apply`.

## Outputs

The following values are output by the Terraform configuration in `outputs.tf`:

| Output Name | Description |
| ----------- | ----------- |
| `ec2_instance_id` | ID of the created EC2 instance |
| `ec2_public_ip` | Public IP address of the created EC2 instance |
| `rds_endpoint` | Endpoint for the created RDS instance |

You can view these outputs after running `terraform apply` by running `terraform output`.

## Cleanup

To delete the resources created by this Terraform configuration, run `terraform destroy`. This will remove all resources created by the configuration. 

## Ansible Configuration

The Ansible configuration is located in the `ansible` directory. It consists of the following directories and files:

### Directories

- `files`: This directory contains the `wp-config.php` file, which is used to configure WordPress.
- `vars`: This directory contains the `main.yml` file, which defines variables used by the Ansible playbook.

### Playbooks

- `aws.yml`: This playbook installs the AWS CLI and configures it with your AWS access key and secret key. It also installs the required packages for the playbook, creates the `www` directory, and sets the appropriate permissions on the directory. Finally, it downloads and extracts WordPress to the `www` directory and sets the appropriate ownership and permissions on the WordPress files.
- `playbook.yml`: This playbook installs and configures a LAMP stack on the EC2 instance, and installs and configures WordPress.

### Other Files

- `backup.sh`: This script backs up the WordPress


I hope this helps! Let me know if you have any questions or need further assistance.
