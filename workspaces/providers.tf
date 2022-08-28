terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "0.36.1"
    }
  }
}

provider "tfe" {
 token = var.token # Configuration options
}


