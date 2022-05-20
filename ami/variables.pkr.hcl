//  variables.pkr.hcl

// For those variables that you don't provide a default for, you must
// set them from the command line, a var-file, or the environment.

variable "instance_type" {
  type =  string
  default = "t2.large"

}

variable "region" {
    type = string
    default = "us-west-1"
}

variable "ami_regions" {
  type = list(string)
  default = ["us-east-1", "us-west-1"]
}

variable "user" {
    type = string
    default = "ec2-user"
    // Sensitive vars are hidden from output as of Packer v1.6.5
    sensitive = true
    
}
variable "ami_prefix" {
  type    = string
  default = "amazon-linux-2-arm"
}

variable "app_name" {
  type    = string
  default = "vault"
}

variable "source_ami_owner" {
  type    = string
  default = "amazon"
}