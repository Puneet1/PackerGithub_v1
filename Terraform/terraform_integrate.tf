#Comment the below code when moving demo from CLI to VCS intergation with Terraform Cloud
# For Terraform Cloud CLI intergation below code provides information on which organization
# and workspace to target

terraform {
  cloud {
    organization = "hashicorp-demo-20220519"

    workspaces {
      name = "PackerGithub_v1_fixed"
    }
  }
}