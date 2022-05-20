# PackerGithub_v1

## Note:
1. Terraform Cloud working and code was planned for the Demo.
2. Some code is changed/intentionally missing and was planned during the demo and was part of showcasing features such as remote backend storage and conig.
3. The environment variables configured on the Github repo for AWS Creds may be removed for now for security purposes.


This Repo has three major components:
Github actions workflow under- .github\workflows\packer.yaml
Packer ami building code under - ami
Terraform code for provisioning Ec2 with AMI build through Packer- Terraform directory

## Lets look at each of the directories:

## .github\workflows\packer.yaml

We have developed a DevOps pipeline using github actions intergarting with packer. A packer build job runs when we a merge is detected on the main branch for directory "ami".

## ami
This directory primarily contains the Packer code
 Lets look at briefly what each code file does:
 - ami\ami.json.pkr.hcl - file contains the core code for packer build file.
 - ami\data.pkr.hcl - this file contains the data related to the packer build code.
 - ami\sample_file.txt - This is a dummy file to showcase the file provisioner in the packer build.
 - ami\variables.pkr.hcl - File contains all the variables consumed by other files in the ami directory.
 - ami\vault-install-script.sh - Script utilized by the shell provisioner for installing Vault application

 ## Terraform
 This directory primarily contains the Terraform code
 module directory: contains the ec2 module code for using the packer built AMI
    standalone_ec2.tf - contains the code for ec2 resource.
    variables.tf - contains variables referenced in the above files.

 data.tf - contains the data block for referencing the ami built with packer.
 main.tf - calls the ec2 module for creating the VM in the Cloud.
 output.tf - contains the output code that provider information for the provisioning steps
 provider.tf - contains the provider information "aws"
 terraform_integrate.tf - contains workspace and organization information for Terraform Cloud CLI feature showcasing.
 variables.tf - contains the variables references in various file in the terraform code.





