variable "vpc_cidr" {}
variable "enable_dns_support" {}
variable "enable_dns_hostnames" {}
variable "vpc_name" {}
variable "environment" {}
variable "public_subnet_cidr" {}
variable "availability_zone" {}
variable "private_subnet_cidr" {}
variable "private_subnet_azs" {}
variable "public_subnet_azs" {}
variable "tags" {
  type = map(string)
  default = {
    Name        = "default-vpc"
    Environment = "dev"
  }
}
