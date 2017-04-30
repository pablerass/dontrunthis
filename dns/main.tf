provider "aws" {
  region = "eu-west-1"
}

resource "aws_route53_zone" "primary" {
  name = "dontrunthis.com"

  tags = {
    Component = "dns"
  }
}