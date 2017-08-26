provider "aws" {
  version = "~> 0.1"

  region = "eu-west-1"
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

module "state" {
  source = "github.com/pablerass/tf_state"

  name = "dontrunthis"

  tags {
    Component   = "state"
    Environment = "all"
  }
}