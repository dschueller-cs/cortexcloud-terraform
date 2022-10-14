terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.34.0"
    }
  }
}

variable "ACCESS_KEY" {
  type = string
}

variable "SECRET_KEY" {
  type = string
}

variable "SESSION_TOKEN" {
  type = string
}

provider "aws" {
  # Configuration options
  region = "us-east-2"

  access_key = var.ACCESS_KEY
  secret_key = var.SECRET_KEY

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

