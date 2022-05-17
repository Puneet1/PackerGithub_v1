resource "aws_instance" "web_instance" {
  ami           = "ami-02541b8af977f6cdd"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform_Cloud_Demo_Instance"
  }
}