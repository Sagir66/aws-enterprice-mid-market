module "compute_instance" {
  source = "./modules/compute"

  instance_type   = var.instance_type
  ami_id          = var.ami_id
  subnet_id       = var.subnet_id
  security_groups = var.security_groups
  key_name        = var.key_name
  tags = {
    Name        = "MyInstance"
    Environment = "Development"
  }
  aws_instance_id = var.aws_instance_id
}
