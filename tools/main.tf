provider "aws" {
  version = "~> 0.1"

  region = "eu-west-1"
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

module "vpc" {
  source = "github.com/pablerass/tf_aws_vpc"

  name = "tools"

  cidr_block = "10.10.0.0/16"
  public_subnets_cidr_blocks = ["10.10.0.0/24"]
  private_subnets_cidr_blocks = ["10.10.100.0/24"]

  tags = {
    Component = "tools"
  }
}