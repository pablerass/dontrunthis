provider "aws" {
  version = "~> 0.1"

  region = "eu-west-1"
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

module "vpc" {
  source = "github.com/pablerass/tf_aws_vpc"

  name = "staging"

  cidr_block = "10.20.0.0/16"
  public_subnets_cidr_blocks = ["10.20.0.0/24"]
  private_subnets_cidr_blocks = ["10.20.100.0/24", "10.20.101.0/24"]

  tags = {
    Component = "staging"
  }
}