provider "aws" {
  region = "eu-west-1"
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