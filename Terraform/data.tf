data "aws_ami" "packer_image" {
  most_recent = true

  filter {
    name   = "tag:Created-by"
    values = ["Packer"]
  }
  owners = ["self"]
}

data "amazon-ami" "amazon-linux-2-arm" {
  filters = {
    name                = "amzn2-ami-hvm-2.*-arm64-gp2"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }
  most_recent = true
  owners      = ["amazon"]
  region      = var.region
}