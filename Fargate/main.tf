terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = var.region
}
terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "hiapp-terraform-state"
    key            = "aws/02-fargate/terraform.tfstate"
    region         = "ap-southeast-1"
    shared_credentials_file = "~/.aws/credentials"
    encrypt        = true
  }
}
