provider "aws" {
  version = "~> 0.1"

  region = "eu-west-1"
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

resource "aws_route53_zone" "primary" {
  name = "dontrunthis.com"

  tags = {
    Component = "dns"
  }
}