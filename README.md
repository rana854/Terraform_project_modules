# AWS Infrastructure Provisioning with Terraform

This project provisions a full AWS infrastructure using Terraform, including:
- VPC with public and private subnets
- EC2 instance with IAM Role and S3 read access
- RDS PostgreSQL database
- Internet Gateway and Route Tables
- S3 bucket (with server-side encryption)
- API Gateway and Route 53 for custom domain

# prerequisites you need before running  :

-	Install Terraform: You need to have Terraform installed on your local machine or the environment where you intend to run Terraform. 
-	AWS Account: You must have an AWS account to create resources using Terraform. 
-	AWS CLI Configuration: Configure your AWS credentials on your local machine or the environment where Terraform will be executed.

 # The project structure is organized as follows:
 
 - modules  : Contains subdirectories for each Terraform module.
- main.tf : Main Terraform configuration file that references modules and resources.
- variables.tf: Defines input variables used throughout the project.
- terraform.tfvars: define the values of variables that are declared in variables.tf
- outputs.tf: Defines output variables to expose certain information.
- provider.tf: Define the provider(s) you're using within your Terraform configuration
- 
# To use this code

- git clone https://github.com/rana854/Terraform_project_modules/
-  Run `terraform init` to initialize the project. 
- Run `terraform plan` to review the planned changes.
- Run `terraform apply` to apply the changes and provision the resources on AWS.

# How to Tear Down the Infrastructure

- terraform destroy



  
