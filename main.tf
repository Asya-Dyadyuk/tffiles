terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ca-central-1"
}

# Create a VPC
resource "aws_vpc" "asya" {
  cidr_block = "192.170.5.0/24"
  tags = {
    "name"="asyaVpc"
  }
}

# Subnet web
resource "aws_subnet" "subnet_web" {
  vpc_id = aws_vpc.asya.id
  cidr_block = "192.170.5.0/27"
  tags = {
    "name"="subnetWeb"
  }
}

# Subnet app
resource "aws_subnet" "subnet_app" {
  vpc_id = aws_vpc.asya.id
  cidr_block = "192.170.5.32/27"
  tags = {
    "name"="subnetApp"
  }
}

# Subnet db
resource "aws_subnet" "subnet_db" {
  vpc_id = aws_vpc.asya.id
  cidr_block = "192.170.5.64/28"
  tags = {
    "name"="subnetDb"
  }
}


