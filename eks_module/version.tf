terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.62.0"
    }

    helm = {
      source = "hashicorp/helm"
      version = "2.9.0"
    }
  }
}