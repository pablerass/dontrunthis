provider "aws" {
  region = "eu-west-1"
}

module "state" {
  source = "github.com/pablerass/tf_terragrunt_state"

  name = "dontrunthis"

  tags {
    Component   = "state"
    Environment = "all"
  }
}