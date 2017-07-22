data "terraform_remote_state" "dns" {
  backend = "s3"
  config {
    encrypt = "true"
    bucket = "dontrunthis.state"
    key = "dns.tfstate"
    region = "eu-west-1"
  }
}

resource "aws_route53_zone" "staging_public" {
  name = "staging.${data.terraform_remote_state.dns.name}"

  tags = {
    Component = "staging"
  }
}

resource "aws_route53_zone" "staging_private" {
  name   = "staging.${data.terraform_remote_state.dns.name}.local"
  vpc_id = "${module.vpc.id}"

  tags = {
    Component = "staging"
  }
}

resource "aws_route53_record" "primary_staging" {
  zone_id = "${data.terraform_remote_state.dns.zone_id}"
  name    = "staging"
  type    = "NS"
  ttl     = "86400"
  records = ["${aws_route53_zone.staging_public.name_servers}"]
}