terraform {
  required_version = "0.15.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.44.0"
    }
  }
}

provider "aws" {
  region                  = var.region
  shared_credentials_file = pathexpand("~/yourcredentialspath")
  profile                 = var.profile
}
