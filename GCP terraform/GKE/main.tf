terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.22.0"
    }
  }
}

provider "google" {
 project = var.google_project
  region  = "us-central1"
  zone    = "us-central1-c"
}