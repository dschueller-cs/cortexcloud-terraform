terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.34.0"
    }
  }
}

locals {
  region      = "us-east-2"
}

provider "aws" {
  # Configuration options
  region = local.region
  profile = "darren1-admin"

  # Make it faster by skipping some things
  skip_get_ec2_platforms      = true
  skip_metadata_api_check     = true
  skip_region_validation      = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true
}

module "testbucket1" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  bucket = "c12etestbucket1"
  acl = "private"
}

module "testbucket2" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  bucket = "c12etestbucket2"
  acl = "private"
}

module "testbucket3" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  bucket = "c12etestbucket3"
  acl = "private"
}

