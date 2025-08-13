variable "aws_instance_id" {
  description = "The ID of the AWS instance"
  type        = string
  default     = ""

}

variable "ami_id" {
  description = "The AMI to use for the instance"
  type        = string
  default     = "" # Replace with a valid AMI ID
}

variable "instance_type" {
  description = "The type of instance to create"
  type        = string
  default     = "" # Default instance type
}


variable "key_name" {
  description = "The name of the key pair to use for SSH access"
  type        = string
  default     = "" # Replace with your key pair name if needed

}
