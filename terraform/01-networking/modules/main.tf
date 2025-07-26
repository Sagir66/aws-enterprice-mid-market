
## Terraform module to create a VPC with an Internet Gateway
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name        = var.vpc_name
    Environment = var.environment
  }

}


## Internet Gateway for public the VPC
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id


  tags = {
    Name        = "${var.vpc_name}-igw"
    Environment = var.environment
  }
}


## public subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.availability_zone

  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.vpc_name}-public-subnet"
    Environment = var.environment
  }
}

## Route table for public subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name        = "${var.vpc_name}-public-route-table"
    Environment = var.environment
  }

}

## Elastic IP for NAT Gateway
resource "aws_eip" "nat" {


  tags = {
    Name        = "${var.vpc_name}-nat-eip"
    Environment = var.environment
  }
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "my-nat-gateway"
  }
}

## private subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone

  tags = {
    Name        = "${var.vpc_name}-private-subnet"
    Environment = var.environment
  }
}
## Private route table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.id
  }
  tags = {
    Name        = "${var.vpc_name}-private-route-table"
    Environment = var.environment
  }
}


## private association
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id

}
