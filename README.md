
# AWS 3-Tier Architecture

This project provisions a 3-tier architecture on AWS using Terraform. It includes networking, security, compute (EC2), and database (RDS) resources, following best practices for modularity and security.

## Project Structure

- `main.tf`: AWS provider configuration.
- `variables.tf`: All input variables (region, VPC/subnet CIDRs, DB credentials, key name, etc.).
- `networking.tf`: VPC, public/private subnets, and internet gateway.
- `security_groups.tf`: Security groups for EC2 and RDS, with rules for SSH and MySQL access.
- `ec2.tf`: Launches an EC2 instance in the public subnet, installs MySQL client.
- `rds.tf`: Provisions a MySQL RDS instance in private subnets with enhanced security and reliability.
- `data.tf`: Fetches the latest Amazon Linux 2 AMI.
- `output.tf`: Outputs EC2 public IP and RDS endpoint.

## Key Features

- **Networking**: Custom VPC with public and private subnets across multiple AZs for high availability.
- **Security**: Security groups restrict access (SSH to EC2, MySQL from EC2 to RDS only).
- **Compute**: EC2 instance with user data to install MySQL client.
- **Database**: RDS MySQL instance with:
  - Encrypted storage
  - Automated backups (7 days)
  - Deletion protection
  - Automatic minor version upgrades
  - Subnet group for high availability (multi-subnet)

## Variables

Define these in `terraform.tfvars` or via CLI:

```hcl
region                  = "ap-south-1"
vpc_cidr                = "10.2.0.0/16"
public_subnet_cidr      = "10.2.1.0/24"
private_app_subnet_cidr = "10.2.2.0/24"
private_db_subnet_cidr  = "10.2.3.0/24"
db_username             = "admin"
db_password             = "terraform123"
key_name                = "your-keypair-name"
private_db_subnet_ids   = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"] # Replace with your private subnet IDs
```

## Outputs

- `ec2_public_ip`: Public IP of the EC2 instance
- `rds_endpoint`: Endpoint of the RDS MySQL instance

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

## Notes

- Ensure your AWS credentials are configured (via environment variables or AWS CLI).
- The RDS password is marked as sensitive and should be managed securely.
- Update subnet IDs and key pair name as per your AWS environment.
