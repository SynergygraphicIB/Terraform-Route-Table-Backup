# -Terraform-Route-Table-Backup
 This project uses Terraform to create a backup of an existing route table in AWS. The existing route table is replicated in a new route table and associated with a specific subnet. This project allows users to have a backup of their route tables in AWS and facilitate recovery in case of a failure or data loss.
# Terraform Route Table Backup

This project uses Terraform to create a backup of an existing route table in AWS. The existing route table is replicated in a new route table and associated with a specific subnet. This project allows users to have a backup of their route tables in AWS and facilitates recovery in case of a failure or data loss.

## Prerequisites
- AWS account
- Terraform installed on your machine

## Getting Started
1. Clone the repository to your local machine:
    ```
    git clone https://github.com/SynergygraphicIB/-Terraform-Route-Table-Backup.git
    ```
2. Navigate to the project directory:
    ```
    cd terraform-route-table-backup
    ```
3. Set the values of the variables in the `terraform.tfvars` file or provide values for the variables when running the `terraform apply` command.
4. Run the following commands to initialize Terraform, create a plan, and apply the changes in AWS:
    ```
    terraform init
    terraform plan
    terraform apply
    ```
5. Verify that the backup of the existing route table has been created in AWS.

## Files and Directories
- `main.tf`: Contains the Terraform code for creating the backup of the existing route table.
- `provider.tf`: Contains the Terraform code for configuring the AWS provider.
- `variables.tf`: Contains the Terraform code for defining the variables used in the project.
- `terraform.tfvars`: Contains the values of the variables used in the project.
- `.gitignore`: Contains a list of files and directories that should not be tracked by Git.

## Conclusion
This project demonstrates how to use Terraform to create a backup of an existing route table in AWS. By having a backup of your route tables, you can ensure that your network infrastructure is protected and can be quickly recovered in case of a failure or data loss.
