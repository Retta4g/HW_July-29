provider "aws" {
  region = "us-east-1"
}

# VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = var.vpc_name
  }
}

# Subnet
resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = var.subnet_name
  }
}

# Network Interface
resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]
  security_groups = var.vpc_security_group_ids

  tags = {
    Name = "primary_network_interface"
  }
}

# Call EC2 Instance Module
module "ec2_instance" {
  source                = "./modules/ec2_instance"
  instance_type         = var.instance_type
  instance_name         = var.instance_name
  instance_ami          = var.instance_ami
  network_interface_id  = aws_network_interface.foo.id
  key_name              = var.key_name
}


terraform {
  cloud {
    organization = "02-spring-cloud"

    workspaces {
      name = "workspace-test"
    }
  }
}