terraform {
  cloud {
    organization = "hashicorp-demo-20220519"

    workspaces {
      name = "PackerGithub_v1"
    }
  }
}