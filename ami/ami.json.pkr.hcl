# This file was autogenerated by the 'packer hcl2_upgrade' command. We
# recommend double checking that everything is correct before going forward. We
# also recommend treating this file as disposable. The HCL2 blocks in this
# file can be moved to other files. For example, the variable blocks could be
# moved to their own 'variables.pkr.hcl' file, etc. Those files need to be
# suffixed with '.pkr.hcl' to be visible to Packer. To use multiple files at
# once they also need to be in the same folder. 'packer inspect folder/'
# will describe to you what is in that folder.

# Avoid mixing go templating calls ( for example ```{{ upper(`string`) }}``` )
# and HCL2 calls (for example '${ var.string_value_example }' ). They won't be
# executed together and the outcome will be unknown.

# All generated input variables will be of 'string' type as this is how Packer JSON
# views them; you can change their type later on. Read the variables type
# constraints documentation
# https://www.packer.io/docs/templates/hcl_templates/variables#type-constraints for more info.
variable "AWS_ACCESS_KEY_ID" {
  type    = string
  default = "${env("AWS_ACCESS_KEY")}"
}

variable "AWS_SECRET_ACCESS_KEY" {
  type    = string
  default = "${env("AWS_SECRET_KEY")}"
}

variable "region" {
  type    = string
  default = "us-west-1"
}

variable "source_ami" {
  type    = string
  default = "ami-02541b8af977f6cdd"
}

# source blocks are generated from your builders; a source can be referenced in
# build blocks. A build block runs provisioner and post-processors on a
# source. Read the documentation for source blocks here:
# https://www.packer.io/docs/templates/hcl_templates/blocks/source
source "amazon-ebs" "autogenerated_1" {
  access_key = "${var.AWS_ACCESS_KEY_ID}"
  ami_description = "Amazon Linux Image with Sample Text File"
  ami_name        = "custom-test-ami_1"
  instance_type   = "t2.micro"
  profile         = "default"
  region          = "${var.region}"
  run_tags = {
    Name = "packer-builder-docker"
  }
  secret_key   = "${var.AWS_SECRET_ACCESS_KEY}"
  source_ami   = "${var.source_ami}"
  ssh_timeout  = "2m"
  ssh_username = "ec2-user"
  tags = {
    Author      = "user"
    Environment = "devops-demo"
    Tool        = "Packer"
  }

}

# a build block invokes sources and runs provisioning steps on them. The
# documentation for build blocks can be found here:
# https://www.packer.io/docs/templates/hcl_templates/blocks/build
build {
  sources = ["source.amazon-ebs.autogenerated_1"]

  provisioner "file" {
    destination = "/tmp/hello.txt"
    source      = "./hello.txt"
  }

}
