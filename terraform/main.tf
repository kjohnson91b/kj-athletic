terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket  = "kj-athletic-terraform-state"
    key     = "terraform/state.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
