provider "aws" {
  region = "us-west-1"
}

module my_ec2 {
    source = "./modules"
}