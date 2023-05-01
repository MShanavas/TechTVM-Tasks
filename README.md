TechTVM-Tasks 
Terraform Configuration
This repository contains Terraform code that creates AWS EC2, S3, and RDS resources.

Prerequisites
To use this Terraform configuration, you'll need:

An AWS account with administrative privileges
The Terraform CLI installed on your machine
Usage
Clone the repository using the command git clone https://github.com/MShanavas/TechTVM-Tasks.git.

Navigate to the terraform directory using cd TechTVM-Tasks/terraform.

Set your AWS IAM access key and secret key, and RDS database password as environment variables
Run terraform init to initialize the Terraform configuration.

Run terraform plan to preview the resources that Terraform will create.

Run terraform apply to create the resources.

After Terraform has finished creating the resources, you can view the instance ID, public IP address of the EC2 instance, and RDS endpoint by running terraform output.
