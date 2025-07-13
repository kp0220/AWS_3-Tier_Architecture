# rds.tf

variable "private_db_subnet_ids" {
  description = "List of private subnet IDs for the RDS subnet group"
  type        = list(string)
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "day7-db-subnet-group"
  # Include all private subnet IDs for high availability
  subnet_ids = var.private_db_subnet_ids

  tags = {
    Name = "day7-db-subnet-group"
  }
}

resource "aws_db_instance" "db" {
  allocated_storage           = 20
  engine                      = "mysql"
  engine_version              = "8.0"
  instance_class              = "db.t3.micro"
  username                    = var.db_username
  password                    = var.db_password
  db_subnet_group_name        = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids      = [aws_security_group.rds_sg.id]
  skip_final_snapshot         = true
  publicly_accessible         = false
  multi_az                    = false
  storage_encrypted           = true
  backup_retention_period     = 7
  auto_minor_version_upgrade  = true
  deletion_protection         = true

  tags = {
    Name = "day7-mysql-db"
  }
}