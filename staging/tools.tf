module "consul" {
  source = "github.com/pablerass/tf_aws_consul"

  server_count  = 3

  key_pair      = "main"
  subnet_ids    = "${module.vpc.private_subnet_ids}"
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.nano"

  tags = {
    Component = "staging"
  }

  instance_tags = {
    AnsibleUser = "ubuntu"
    AnsiblePythonInterpreter = "/usr/bin/python3"
  }
}