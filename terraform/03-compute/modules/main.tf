resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "Terraform Instance"
  }

  lifecycle {
    create_before_destroy = true
  }

}
