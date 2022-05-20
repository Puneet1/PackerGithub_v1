resource "aws_instance" "vault_instance" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type

  tags = {
    Name = "Terraform_Cloud_Demo_Instance"
  }
}