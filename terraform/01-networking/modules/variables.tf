
variable "tags" {
  description = "A map of tags to assign to the VPC"
  type        = map(string)
  default     = {}

}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "environment" {
  description = "The environment for the VPC (e.g., dev, staging, prod)"
  type        = string
}
variable "enable_dns_support" {
  description = "Whether to enable DNS support in the VPC"
  type        = bool
  default     = true
}
variable "enable_dns_hostnames" {
  description = "Whether to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "subnet_count" {
  description = "The number of subnets to create in the VPC"
  type        = number
  default     = 1
}
variable "availability_zones" {
  description = "A list of availability zones to use for the subnets"
  type        = list(string)
  default     = []
}

variable "map_public_ip_on_launch" {
  description = "Whether to map public IP addresses on launch for the subnets"
  type        = bool
  default     = false
}

variable "vpc_tags" {
  description = "A map of tags to assign to the VPC"
  type        = map(string)
  default     = {}
}


variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
  type        = string
  default     = ""

}

variable "availability_zone" {
  description = "The availability zone for the public subnet"
  type        = string
  default     = ""

}


variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = ""

}


