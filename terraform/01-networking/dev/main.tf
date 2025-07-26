module "namespace" {
  source = "./modules"

  vpc_cidr             = var.vpc_cidr
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  vpc_name             = var.vpc_name
  environment          = var.environment
  public_subnet_cidr   = var.public_subnet_cidr
  availability_zone    = var.availability_zone
  private_subnet_cidr  = var.private_subnet_cidr
  private_subnet_azs   = var.private_subnet_azs
  public_subnet_azs    = var.public_subnet_azs
  tags = {
    Name        = var.vpc_name
    Environment = var.environment
  }


}
