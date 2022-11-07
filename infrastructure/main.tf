provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket  = "hhreax-cinema-tfstate"
    key     = "hhreax-cinema.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Environment = terraform.workspace
    Project     = var.project
    ManagedBy   = "Terraform"
    Owner       = "Charles Hodge"
  }
}
