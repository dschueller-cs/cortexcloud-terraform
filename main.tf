terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.34.0"
    }
  }
}

# variable "ACCESS_KEY" {
#   type = string
# }

# variable "SECRET_KEY" {
#   type = string
# }

# variable "SESSION_TOKEN" {
#   type = string
# }

provider "aws" {
  # Configuration options
  region = "us-east-2"

  # access_key = var.ACCESS_KEY
  # secret_key = var.SECRET_KEY
  # token = var.SESSION_TOKEN
  profile = "dsdev1-admin"

  # Make it faster by skipping some things
  skip_get_ec2_platforms      = true
  skip_metadata_api_check     = true
  skip_region_validation      = true
  skip_credentials_validation = true
  skip_requesting_account_id  = false
}

