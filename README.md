
# AWS 3-Tier Architecture

This project provisions a 3-tier architecture on AWS using Terraform, including networking, EC2, RDS, and security groups.

## Notable RDS Improvements

- RDS subnet group now uses a variable `private_db_subnet_ids` to support high availability across multiple private subnets.
- RDS instance has enhanced security and reliability:
  - Storage encryption enabled
  - Automated backups retained for 7 days
  - Automatic minor version upgrades
  - Deletion protection enabled

## New Variable

Add the following to your `terraform.tfvars` or provide via CLI:

```hcl
private_db_subnet_ids = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]
```

Replace the values with your actual private subnet IDs.

## Usage

1. Initialize Terraform:
   ```sh
   terraform init
   ```
2. Plan the deployment:
   ```sh
   terraform plan
   ```
3. Apply the configuration:
   ```sh
   terraform apply
   ```
