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

/*
resource "tfe_oauth_client" "test" {
  name             = "my-github-oauth-client"
  organization     = "krynn1"
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.oauth
  service_provider = "github"
}*/