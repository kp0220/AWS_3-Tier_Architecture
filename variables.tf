# variables.tf
variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.2.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.2.1.0/24"
}

variable "private_app_subnet_cidr" {
  default = "10.2.2.0/24"
}

variable "private_db_subnet_cidr" {
  default = "10.2.3.0/24"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  default = "terraform123"
  sensitive = true
}

variable "key_name" {
  type = string
}